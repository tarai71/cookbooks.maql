#
# Cookbook Name:: mysql55
# Recipe:: default
#
## variables (self ip)
node_ip = (`LANG=C; ifconfig |grep inet |awk '{print $2}' |cut -d':' -f2 |grep -v 127.0.0.1`)
my_ip = (`LANG=C; ifconfig |grep inet |awk '{print $2}' |cut -d':' -f2 |grep -v 127.0.0.1 |tail -n 1`)

yum_package "sysstat"
service "sysstat" do
	action [ :start, :enable ] 
end

## install client
include_recipe "mysql55::client"

## install server
yum_package "mysql55-server" do
  version node['mysql55_version']
  action :install
	flush_cache [ :before ]
end

## /etc/my.cnf
directory "/etc/mysql.d" do
	owner "root"
	group "root"
	mode "0755"
	action :create
end

template "/etc/my.cnf" do
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
	notifies :restart, "service[mysql-server]", :immediately

	variables ({
		:my_ip => my_ip.chomp
	})
end

## /etc/logrotate.d/mysql
template "/etc/logrotate.d/mysql" do
	source "logrotate-mysql.erb"
	owner "root"
	group "root"
	mode "0644"
	action :create
end

## default settings
execute "setting-default" do
  command "mysql -u root \
  < #{node['mysql55_server_conf_dir']}/setting-default.sql && \
  touch #{node['mysql55_server_conf_dir']}/setting-default.sql.executed"
  creates "#{node['mysql55_server_conf_dir']}/setting-default.sql.executed"
  action :nothing
end

template "#{node['mysql55_server_conf_dir']}/setting-default.sql" do
  source "setting-default.sql.erb"
  owner "root"
  group "root"
  mode "0600"
  notifies :run, resources(:execute => "setting-default"), :immediately

	variables({
		:node_ip => node_ip.split("\n")
	})
end

## start, enable
include_recipe "mysql55::service"
s = resources("service[mysql-server]")
s.action [ :start, :enable ]

