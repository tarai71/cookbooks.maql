#
# Cookbook Name:: mysql55
# Recipe:: client
#
yum_package "mysql55-client" do
  version node['mysql55_version']
  action :install
	flush_cache [ :before ]
end
