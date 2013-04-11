#
# Cookbook Name:: mha
# Recipe:: uninstall_masterha_node
#
yum_package "masterha_node" do
	package_name node['mha_node_package_name']
  action :remove
end

directory "/var/tmp/masterha" do
	action :delete
	recursive true
end
