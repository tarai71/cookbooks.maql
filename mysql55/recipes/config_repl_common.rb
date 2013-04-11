#
# Cookbook Name:: mysql55
# Recipe:: config_repl_common
#
include_recipe "mysql55::service"

## install semi-sync plugin
## common (master/slave/bkup)
%w(rpl_semi_sync_master rpl_semi_sync_slave).each do |p|
  bash "install-plugin #{p}" do
    user "root"
    code <<-EOH
    mysql -u root -p\"#{node['mysql55_server_root_password']}\" -e \
    "INSTALL PLUGIN #{p} soname 'semisync_#{p[14,6]}.so';"
    EOH
    not_if "mysql -u root -p\"#{node['mysql55_server_root_password']}\" -e \'show plugins;\' |grep ACTIVE |grep #{p}"
  end
end

## /etc/mysql.d/repl.cnf
## common (master/slave/bkup)
template "/etc/mysql.d/repl.cnf" do
  source "repl.cnf.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, "service[mysql-server]", :immediately
end

## add scp-user
## common (master/slave/bkup)
scp_user "add scp-user (send dump-data to slave or bkup)" 
