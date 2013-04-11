#
# Cookbook Name:: mha
# Recipe:: masterha_manager
#
#include_recipe "mysql55::client"
#include_recipe "mha::mha4mysql-node"

## install masterha_manager
yum_package "masterha_manager" do
  package_name node['mha_manager_package_name']
  version node['mha_manager_version']
  action :install
  flush_cache [ :before ]
end

## set /etc/masterha_default.cnf
template "/etc/masterha_default.cnf" do
  source "masterha_default.cnf.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :run, "bash[masterha_manager start|restart]"
end

template "/usr/local/sbin/master_ip_failover.sh" do
  source "master_ip_failover.sh.erb"
  owner "root"
  group "root"
  mode "0755"

  variables ({
    :lvs_rip => node['mha_lvs']
  })
end

directory "/var/log/masterha" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

## set /etc/mha.d/masterha_#{app_name}.cnf
directory "/etc/mha.d" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

node['mha_dbs'].to_hash.each do |app_name,db|
  template "/etc/mha.d/masterha_#{app_name}.cnf" do
    source "masterha_app.cnf.erb"
    owner "root"
    group "root"
    mode "0644"
    action :create
    notifies :run, "bash[masterha_manager start|restart]"

    variables ({
      :db_master_rip => db[:master_rip],
      :db_slave_rip => db[:slave_rip],
      :db_bkup_rip => db[:bkup_rip]
    })
  end
end

## set /root/.ssh/known_hosts (for lvs)
## - todo : add support DB
node['mha_lvs'].each do |lvs|
	bash "add known_hosts" do
		user "root"
		cwd "/root"
		code <<-EOH
		ssh-keyscan -t rsa #{lvs} >> .ssh/known_hosts
		EOH
		not_if "egrep \"^#{lvs}\" /root/.ssh/known_hosts"
	end
end

## check
ruby_block "masterha_check" do
  block do
    puts "\n--------------------------------------------"
    puts "## masterha_check_ssh"
    puts `for i in $(find /etc/mha.d/*.cnf); do masterha_check_ssh --conf=$i; done` 
    puts "\n--------------------------------------------"
    puts "## masterha_check_repl"
    puts `for i in $(find /etc/mha.d/*.cnf); do masterha_check_repl --conf=$i; done` 
    puts "\n--------------------------------------------"
  end
end

## service
bash "masterha_manager start|restart" do
  user "root"
	cwd "/etc/mha.d"
  code <<-EOH
  for i in $(find *.cnf); do
    pgrep -f \"masterha_manager --conf=/etc/mha.d/${i}\"
    if [ $? -eq 0 ]; then
      masterha_stop --conf=$i
      masterha_manager --conf=/etc/mha.d/${i} >> /var/log/masterha/${i%.cnf}.log 2>&1 &
    else
      masterha_manager --conf=/etc/mha.d/${i} >> /var/log/masterha/${i%.cnf}.log 2>&1 &
    fi
  done
  EOH
	action :nothing
end

## log
ruby_block "masterha_check_status" do
  block do
    puts "\n--------------------------------------------"
    puts "## masterha_check_status"
    puts `sleep 3; for i in $(find /etc/mha.d/*.cnf); do masterha_check_status --conf=$i ; done` 
    puts "\n--------------------------------------------"
  end
	action :nothing
	subscribes :create, resources(:bash => "masterha_manager start|restart")
end
