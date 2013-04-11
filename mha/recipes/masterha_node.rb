#
# Cookbook Name:: mha
# Recipe:: masterha_node
#
## variables (all rip of self db group)
self_db_group_all_rip = []

node['mha_dbs'].to_hash.each do |app_name,db|
	if app_name == node['mha_self_db_group'] then
		self_db_group_all_rip = db[:master_rip] | db[:slave_rip] | db[:bkup_rip]
	end
end

mha_lvs = node['mha_lvs']
db_lvs_all_rip = self_db_group_all_rip | mha_lvs

## install masterha_node
yum_package "masterha_node" do
  package_name node['mha_node_package_name']
  version node['mha_node_version']
  action :install
  flush_cache [ :before ]
end

root_ssh_key "for_mha" do
  action :create
end

## set mha account on mysql (only mysql replication set )
unless node['mha_self_db_group'] == "unknown" then

	template "/var/lib/mysql/setting_mha.sql" do
		source "setting_mha.sql.erb"
		action :create
	#  notifies :run, "bash[set_mha_user_on_mysql]", :immediately

		variables({
			:db_lvs_all_rip => db_lvs_all_rip
		})
	end

	bash "set_mha_user_on_mysql" do
		user "root"
		cwd  "/var/lib/mysql"
		code <<-EOH
		mysql -u root -p\"#{node['mha_mysql_server_root_password']}\" < ./setting_mha.sql
		EOH
	#  action :nothing
		action :run
	end

end

## create directory
## - log
#directory "/var/log/masterha" do
# action :create
# recursive true
#end

## - tmp
directory "/var/tmp/masterha" do
  action :create
  recursive true
end
