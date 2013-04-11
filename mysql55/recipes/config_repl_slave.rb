#
# Cookbook Name:: mysql55
# Recipe:: config_repl_slave
#
include_recipe "mysql55::service"

## set master/slave/backup node's IP
## common (master/slave/bkup)
master_ip = node['mysql55_server_master_rip'].split(/\s*,\s*/)
slave_ip = node['mysql55_server_slave_rip'].split(/\s*,\s*/)
bkup_ip = node['mysql55_server_bkup_rip'].split(/\s*,\s*/)
all_ip = master_ip | slave_ip | bkup_ip

## check self node-type
## common (master/slave/bkup)
node_type = "unknown"
node_ip = (`LANG=C; ifconfig |grep inet |awk '{print $2}' |cut -d':' -f2 |grep -v 127.0.0.1`).split

if !(node_ip & master_ip).empty? then
  node_type = "master"
elsif !(node_ip & slave_ip).empty? then
  node_type = "slave"
elsif !(node_ip & bkup_ip).empty? then
  node_type = "bkup"
end

if node_type == "slave" || node_type == "bkup" then

## set master info
## slave
  master_info = `grep "^-- CHANGE MASTER TO" /tmp/setting-repl-master.dump`
  master_log_file = master_info.split(/[,=;]/)[1]
  master_log_pos = master_info.split(/[,=;]/)[3]

## restore master's snapshot & set replication
## slave 
  bash "restore-snapshot(mysqldump) \'slave, bkup\'" do
    user "root"
    group "root"
    cwd node['mysql55_server_conf_dir']
    creates "./setting-repl-master.dump"
    code <<-EOH
    cp /tmp/setting-repl-master.dump ./
    mysql -u root -p\"#{node['mysql55_server_root_password']}\" < ./setting-repl-master.dump
    EOH
  end

  template "#{node['mysql55_server_conf_dir']}/setting-repl-slave.sql" do
    source "setting-repl-slave.sql.erb"
    action :create
    notifies :run, "bash[setting-replication 'slave']", :immediately

    variables({
      :master_log_file => master_log_file,
      :master_log_pos => master_log_pos
    })
  end

  bash "setting-replication \'slave\'" do
    user "root"
    cwd node['mysql55_server_conf_dir']
    code <<-EOH
    mysql -u root -p\"#{node['mysql55_server_root_password']}\" -e \"stop slave;\"
    mysql -u root -p\"#{node['mysql55_server_root_password']}\" < ./setting-repl-slave.sql
    EOH
    action :nothing
  end

## start slave
## slave
  bash "start-slave" do
    user "root"
    cwd node['mysql55_server_conf_dir']
    code <<-EOH
    mysql -u root -p\"#{node['mysql55_server_root_password']}\" -e \"start slave;\"
    sleep 3
    EOH
    action :run
    only_if "mysql -u root -p\"#{node['mysql55_server_root_password']}\" -e \"show #{node_type} status\\G\" |grep Running |grep No"
  end

  ruby_block "check-replication \'#{node_type}\'" do
    block do 
      puts "\n-------------------------------------------"
      puts "## show slave status"
      puts `mysql -u root -p\"#{node['mysql55_server_root_password']}\" -e \"show #{node_type} status\\G\"` 
      puts "\n-------------------------------------------"
    end
  end
end

scp_user "remove scp-user (send dump-data to slave or bkup)"  do
  action :remove
end
