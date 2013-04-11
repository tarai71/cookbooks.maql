#
# Cookbook Name:: apache2
# Recipe:: service
#
service "httpd" do
  service_name node['apache2_httpd_package']
	supports :start => true, :stop => true, :restart => true
	action :nothing 
end
