#
# Cookbook Name:: mysql56
# Recipe:: uninstall_client
#
yum_package "mysql56-client" do
  action :remove
end
