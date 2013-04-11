#
# Cookbook Name:: mysql56
# Recipe:: uninstall
#
## uninstall
yum_package "mysql56-server" do
  package_name node['mysql56_server_package_name']
  action :remove
end

directory node['mysql56_server_conf_dir'] do
	action :delete
	recursive true
end

directory "/etc/mysql.d" do
	action :delete
	recursive true
end
