#
# Cookbook Name:: apache2
# Recipe:: config_vhost
#
#include_recipe "apache2"
include_recipe "apache2::service"

## vhost.conf
unless node['apache2_vhost_config'].empty? then
  template "/etc/httpd/conf.d/vhost.conf" do
		source "vhost.conf.erb"
    backup 5
    owner "root"
    group "root"
    mode "0644"
    action :create
		notifies :restart, "service[httpd]"
  end
else
  file "/etc/httpd/conf.d/vhost.conf" do
    action :delete
		notifies :restart, "service[httpd]"
  end
end

