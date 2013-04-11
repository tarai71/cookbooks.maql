#
# Cookbook Name:: memcached
# Recipe:: uninstall
#

yum_package "memcached" do
	  package_name node['memcached_package_name']
    version  node['memcached_version']
    action :remove
end

