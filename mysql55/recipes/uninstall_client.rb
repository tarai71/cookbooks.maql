#
# Cookbook Name:: mysql55
# Recipe:: uninstall_client
#
yum_package "mysql55-client" do
  action :remove
end
