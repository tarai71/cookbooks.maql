#
# Cookbook Name:: apache2
# Recipe:: uninstall
#
yum_package "apr" do
  package_name node['apache2_apr_package']
#  version  node['apache2_apr_version']
  action :remove
end

yum_package "apr-util" do
  package_name node['apache2_apr-util_package']
#  version  node['apache2_apr-util_version']
  action :remove
end

yum_package "httpd" do
  package_name node['apache2_httpd_package']
#  version  node['apache2_httpd_version']
  action :remove
end

yum_package "mod_ssl" do
  package_name node['apache2_mod_ssl_package']
#  version  node['apache2_mod_ssl_version']
  action :remove
end

directory "/etc/httpd" do
	recursive true
  action :delete
end
