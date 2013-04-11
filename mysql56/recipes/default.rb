#
# Cookbook Name:: mysql56
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
include_recipe "mysql56::client"

## install server
yum_package "mysql56-server" do
  version node['mysql56_version']
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
	
	notifies :restart, "service[mysql-server]", :delayed

	variables ({
		:my_ip => my_ip.chomp
	})
end

## init db
bash "mysql_install_db" do
	user "root"
	cwd node['mysql56_server_conf_dir']
	code <<-EOH
	mysql_install_db && touch ./mysql_install_db.executed
	EOH
	not_if "test -f #{node['mysql56_server_conf_dir']}/mysql_install_db.executed"
end

## create log directory
directory "/var/log/mysql" do
	owner "root"
	group "root"
	mode "0755"
	action :create
end

## /etc/logrotate.d/mysql
template "/etc/logrotate.d/mysql" do
	source "logrotate-mysql.erb"
	owner "root"
	group "root"
	mode "0644"
	action :create
end

## start, enable
include_recipe "mysql56::service"
s = resources("service[mysql-server]")
s.action [ :start, :enable ]

## default settings
template "#{node['mysql56_server_conf_dir']}/setting-default.sql" do
  source "setting-default.sql.erb"
  owner "root"
  group "root"
  mode "0600"
	action :create
#  notifies :run, resources(:bash => "setting-default"), :immediately

	variables({
		:node_ip => node_ip.split("\n")
	})
end

bash "setting-default" do
	user "root"
	cwd node['mysql56_server_conf_dir']
	code <<-EOH
  mysql -u root   < ./setting-default.sql &&  touch ./setting-default.sql.executed
	EOH
  action :run
	not_if "test -f #{node['mysql56_server_conf_dir']}/setting-default.sql.executed"
end
