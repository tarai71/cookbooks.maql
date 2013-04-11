#
# Cookbook Name:: apache2
# Recipe:: default
#

## yum install
yum_package "apr" do
  package_name node['apache2_apr_package']
  version  node['apache2_apr_version']
  action :install
	flush_cache [ :before ]
end

yum_package "apr-util" do
  package_name node['apache2_apr-util_package']
  version  node['apache2_apr-util_version']
  action :install
	flush_cache [ :before ]
end

yum_package "httpd" do
  package_name node['apache2_httpd_package']
  version  node['apache2_httpd_version']
  action :install
	flush_cache [ :before ]
#	notifies :start, "service[httpd]"
#	notifies :enable, "service[httpd]"
end


## htpd.conf
template "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf.erb"
  backup 5
  owner "root"
  group "root"
  mode "0644"
  action :create
	notifies :restart, "service[httpd]"
end

## mod_ssl
if node['apache2_LoadModule'].index("ssl") != nil then
  yum_package "mod_ssl" do
    package_name node['apache2_mod_ssl_package']
    version  node['apache2_mod_ssl_version']
    action :install
    flush_cache [ :before ]
  end
  template "/etc/httpd/conf.d/ssl.conf" do
    source "ssl.conf.erb"
    backup 5
    owner "root"
    group "root"
    mode "0644"
    action :create
	  notifies :restart, "service[httpd]"
  end
else
  file "/etc/httpd/conf.d/ssl.conf" do
    action :delete
  end
end

## logrotate
unless node['apache2_logrotate_config'].empty? then
  template "/etc/logrotate.d/httpd" do
		source "logrotate-httpd.erb"
    backup 5
    owner "root"
    group "root"
    mode "0644"
    action :create
  end
else
  file "/etc/logrotate.d/httpd" do
    action :delete
  end
end

## start, enable
include_recipe "apache2::service"
s = resources("service[httpd]")
s.action [ :start, :enable ]
