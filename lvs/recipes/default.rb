#
# Cookbook Name:: lvs
# Recipe:: default
#

## variables (all vip of dbs)
lvs_all_vip = []
node['lvs_dbs_hash'].to_hash.each do |app_name,db|
	lvs_all_vip =  lvs_all_vip | db[:master_vip] | db[:slave_vip] | db[:bkup_vip]
end

## check self ip
node_ip = (`LANG=C; ifconfig |grep inet |awk '{print $2}' |cut -d':' -f2 |grep -v 127.0.0.1`).split

## set /etc/sysctl.conf
## - todo: write definition "linux_sysctl"
bash "modify kernel param" do
  user "root"
  group "root"
  code <<-EOH
  cp -fp /etc/sysctl.conf{,.bak}
	grep \"net.ipv4.ip_forward\" /etc/sysct.conf
	if [ $? -eq 0 ]; then
  sed -i -e \"/^net.ipv4.ip_forward/c net.ipv4.ip_forward = 1\" /etc/sysctl.conf
	else
	echo \"net.ipv4.ip_forward = 1\" >> /etc/sysctl.conf
	fi
  sysctl -p
  EOH
  not_if "grep \"net.ipv4.ip_forward = 1\" /etc/sysctl.conf"
end

## set keepalived
## - install
yum_package "ipvsadm" do
  version  node['lvs_ipvsadm_version']
  action :install
  flush_cache [ :before ]
end

yum_package "keepalived" do
  version  node['lvs_keepalived_version']
  action :install
  flush_cache [ :before ]
end

template "/etc/keepalived/keepalived.conf" do
  source "keepalived.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :reload, "service[keepalived]"

	variables ({
		:lvs_active_rip => node['lvs_vrrp_active_rip'].split,
		:lvs_standby_rip => node['lvs_vrrp_standby_rip'].split,
		:node_ip => node_ip
	})
end

template "/etc/sysconfig/keepalived" do
  source "sysconfig-keepalived.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, "service[keepalived]"
end

## - set /var/log/keepalive.log
bash "set /etc/syslog.conf for keepalived" do
	user "root"
	code <<-EOH
	cp -fp /etc/syslog.conf{,.bak}
	echo \"local1.*          /var/log/keepalived.log\" >> /etc/syslog.conf
	EOH
	not_if "egrep \"^local1.*\" /etc/syslog.conf |egrep \"/var/log/keepalived.log\""
	notifies :restart, "service[syslog]"
end

service "syslog" do
	action :nothing
end

bash "set /etc/logrotate.d/syslog for keepalived" do
	user "root"
	code <<-EOH
  sed -i -e '1s:^:/var/log/keepalived.log :' /etc/logrotate.d/syslog
	EOH
	not_if "egrep \"^\/var\/log\/keepalived.log\" /etc/logrotate.d/syslog"
end

## - service control keepalived, ipvsadm
service "ipvsadm" do
  supports :restart => true, :status => true
  action [ :nothing, :disable ]
end

service "keepalived" do
  supports :restart => true, :reload => true
  status_command "pgrep keepalived"
  action [ :enable, :start ]
end

## nagios-plugins (for healthcheck-script)
## - install 
yum_package "nagios-plugins" do
	version node['lvs_nagios_plugins_version']
  action :install
  flush_cache [ :before ]
end

yum_package "mysql55-client" do
  action :install
  flush_cache [ :before ]
	not_if "which mysql"
end

yum_package "mysql55-shared" do
  action :install
  flush_cache [ :before ]
  not_if "test -f /usr/lib64/libmysqlclient.so"
end

## set iptables
## - todo: write definition "linux_iptables"
yum_package "iptables" do
  action :install
end

bash "touch /etc/sysconfig/iptables" do
	user "root"
	group "root"
	cwd "/etc/sysconfig"
	code <<-EOH
	touch ./iptables
	EOH
	not_if "test -f /etc/sysconfig/iptables"
end

service "iptables" do
  supports :start => true, :stop => true, :restart => true
  action [ :start, :enable ]
end

lvs_all_vip.each do |vip|
  bash "add iptables rule (#{vip})" do
    user "root"
    group "root"
    code <<-EOH
    cp -p /etc/sysconfig/iptables{,.bak}
    iptables -t mangle -A PREROUTING -d #{vip} -j MARK --set-mark 1
    /etc/init.d/iptables save
    EOH
    not_if "/etc/init.d/iptables save; egrep \"^-A PREROUTING -d #{vip} -j MARK --set-mark 0x1\" /etc/sysconfig/iptables"
  end
end

## set routing
## - todo: write definition "linux_route"
bash "add routing table (table 101)" do
  user "root"
  group "root"
  code <<-EOH
  ip rule add prio 100 fwmark 1 table 101
  echo 'prio 100 fwmark 1 table 101' >> /etc/sysconfig/network-scripts/rule-lo
  EOH
  not_if "grep \'prio 100 fwmark 1 table 101\' /etc/sysconfig/network-scripts/rule-lo"
end

bash "add routing entry (default dev lo)" do
  user "root"
  group "root"
  code <<-EOH
  ip route add table 101 local default dev lo
  echo 'table 101 local default dev lo' >> /etc/sysconfig/network-scripts/route-lo
  EOH
  not_if "grep \'table 101 local default dev lo\' /etc/sysconfig/network-scripts/route-lo"
end

## log
## - keepalived status & network info
ruby_block "log" do
  block do
    puts "\n-----------------------------------------"
    puts "## iptables entry at \'mangle\' table"
    puts `iptables -t mangle -L`
    puts "\n-----------------------------------------"
    puts "## ip rule entry"
    puts `ip rule list`
    puts "\n-----------------------------------------"
    puts "## routing entry at table \'101\'"
    puts `ip route show table 101`
    puts "\n-----------------------------------------"
		puts "## ipvsadm entry"
		puts `ipvsadm -Ln`
    puts "\n-----------------------------------------"
  end
end

