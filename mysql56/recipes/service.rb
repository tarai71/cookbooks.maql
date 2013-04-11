#
# Cookbook Name:: mysql56
# Recipe:: service
#
service "mysql-server" do
  service_name "mysqld"
  supports :start => true, :stop => true, :restart => true
  action :nothing
end
