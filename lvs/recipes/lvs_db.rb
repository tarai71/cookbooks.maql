#
# Cookbook Name:: lvs
# Recipe:: lvs_db
#

## variables (all vip of self db group)
self_db_group_all_vip = []

node['lvs_dbs_hash'].to_hash.each do |app_name,db|
	if app_name == node['lvs_self_db_group'] then
		self_db_group_all_vip = db[:master_vip] | db[:slave_vip] | db[:bkup_vip]
	end
end

## install iptables
yum_package "iptables" do
	action :install
end

bash "touch /etc/sysconfig/iptables" do
	user "root"
	code <<-EOH
	touch /etc/sysconfig/iptables
	EOH
	not_if "test -f /etc/sysconfig/iptables"
end

service "iptables" do
	supports :start => true, :stop => true, :restart => true
	action [ :start, :enable ]
end

## set iptables
self_db_group_all_vip.each do |vip|
	bash "add iptables rule #{vip}" do
		user "root"
		group "root"
		code <<-EOH
		iptables -t nat -A PREROUTING -d #{vip} -j REDIRECT
		/etc/init.d/iptables save
		EOH
		not_if "egrep \"^-A PREROUTING -d #{vip} -j REDIRECT\" /etc/sysconfig/iptables"
	end
end

## log
ruby_block "log" do
  block do
    puts "\n-----------------------------------------"
    puts "## iptables entry at \'nat\' table"
    puts `iptables -t nat -L`
    puts "\n-----------------------------------------"
  end
end
