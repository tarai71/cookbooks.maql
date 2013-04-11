#
# Cookbook Name:: memcached
# Recipe:: start
#
service "memcached" do
	supports :start => true, :stop => true, :restart => true, :enable => true
  action :nothing
end

