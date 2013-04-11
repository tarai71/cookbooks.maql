#
# Cookbook Name:: php54
# Recipe:: uninstall
#

## PHP-5.4
execute "remove-php" do
	command "yum -y remove php54-*"
	only_if "rpm -qa |grep php54"
	notifies :restart, "service[httpd]"
end

include_recipe "apache2::service"
