#
# Cookbook Name:: mysql56
# Recipe:: client
#
yum_package "mysql56-client" do
  version node['mysql56_version']
  action :install
	flush_cache [ :before ]
end
