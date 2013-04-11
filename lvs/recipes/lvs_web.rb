#
# Cookbook Name:: lvs
# Recipe:: lvs_web
#

## variables (all vip of self db group)
lvs_all_vip = []
node['lvs_dbs_hash'].to_hash.each do |app_name,db|
	lvs_all_vip = lvs_all_vip | db[:master_vip] | db[:slave_vip] | db[:bkup_vip]
end

## set routing
lvs_all_vip.each do |vip|
	bash "route-add #{vip}" do
		user "root"
		code <<-EOH
		route add -host #{vip} gw #{node['lvs_vrrp_address']} && \
		echo \"any host #{vip} gw #{node['lvs_vrrp_address']}\" >> /etc/sysconfig/static-routes
		EOH
		not_if "egrep \"^any host #{vip} gw #{node['lvs_vrrp_address']}\" /etc/sysconfig/static-routes"
	end
end

## log
ruby_block "log" do
	block do
		puts "\n------------------------------------"
		puts "## check routing"
		puts `netstat -nr`
		puts "\n------------------------------------"
	end
end
