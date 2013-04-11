#
# Cookbook Name:: mysql55
# Recipe:: uninstall
#
## uninstall
yum_package "mysql55-server" do
  action :remove
end

directory node['mysql55_server_conf_dir'] do
	action :delete
	recursive true
end

directory "/etc/mysql.d" do
	action :delete
	recursive true
end
