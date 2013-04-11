#
# Cookbook Name:: memcached
# Recipe:: default
#

## install
yum_package "memcached" do
	  package_name node['memcached_package_name']
    version  node['memcached_version']
    action :install
		flush_cache [ :before ]
end

## /etc/sysconfig/memcached
template "/etc/sysconfig/memcached" do
  source "sysconfig-memcached.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
	notifies :restart, "service[memcached]"
end

## start, enable
include_recipe "memcached::service"
s = resources("service[memcached]")
s.action [ :start, :enable ]
