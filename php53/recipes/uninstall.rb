#
# Cookbook Name:: php53
# Recipe:: uninstall
#

## PHP-5.3
execute "remove-php53" do
	command "yum -y remove php53-*"
	only_if "rpm -qa |grep php53"
	notifies :restart, "service[httpd]"
end

include_recipe "apache2::service"
