#
# Cookbook Name:: mha
# Recipe:: uninstall_masterha_manager
#

yum_package "masterha_manager" do
  package_name node['mha_manager_package_name']
  action :remove
end

yum_package "masterha_node" do
	package_name node['mha_node_package_name']
  action :remove
end

file "/etc/masterha_default.cnf" do
	action :delete
end

%w(/var/log/masterha /var/tmp/masterha /etc/mha.d).each do |dir|
  directory dir do
  	action :delete
  	recursive true
  end
end

