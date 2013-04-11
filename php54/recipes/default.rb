#
# Cookbook Name:: php54
# Recipe:: default
#

#include_recipe "apache2"

## Postfix
yum_package "postfix" do
#  version "2.3.3-10.el5.maql"
  action :install
  flush_cache [ :before ]
end

## PHP-5.4
yum_package "php54" do
  package_name node['php54_php_package_name']
  version node['php54_php_version']
  action :install
  flush_cache [ :before ]
end

## PHP-5.4 Modules
node['php54_Modules'].each do |mod|
  yum_package mod do
    version eval("node['php54_#{mod}_version']")
    action :install
    flush_cache [ :before ]
    notifies :restart, "service[httpd]" 
  end
end

## php.ini
template "/etc/php.ini" do
  source "php.ini.erb"
  backup 5
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, "service[httpd]" 
end

include_recipe "apache2::service"

## Debug
#node['php54_Modules'].each {|mod| puts mod}
