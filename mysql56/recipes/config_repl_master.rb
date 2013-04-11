#
# Cookbook Name:: mysql56
# Recipe:: config_repl_master
#
include_recipe "mysql56::service"

## set master/slave/backup node's IP
## common (master/slave/bkup)
master_ip = node['mysql56_server_master_rip'].split(/\s*,\s*/)
slave_ip = node['mysql56_server_slave_rip'].split(/\s*,\s*/)
bkup_ip = node['mysql56_server_bkup_rip'].split(/\s*,\s*/)
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

## create repl account
## master 
if node_type == "master" then
  template "#{node['mysql56_server_conf_dir']}/setting-repl-master.sql" do
    source "setting-repl-master.sql.erb"
    action :create
    notifies :run, "bash[setting-replication 'master']", :immediately

    variables({
      :master_ip => master_ip,
      :slave_ip => slave_ip,
      :bkup_ip => bkup_ip,
      :all_ip => all_ip
    })
  end

  bash "setting-replication \'master\'" do
    user "root"
    cwd node['mysql56_server_conf_dir']
    code <<-EOH
    mysql -u root -p\"#{node['mysql56_server_root_password']}\" < ./setting-repl-master.sql
    EOH
    action :nothing
  end

  ## take snapshot (mysqldump) & scp
  ## master 
  bash "take-snapshot(mysqldump) \'master\'" do
    user "root"
    cwd node['mysql56_server_conf_dir']
#    creates "#{node['mysql56_server_conf_dir']}/setting-repl-master.dump"
    code <<-EOH
    mysqldump -u root -p\"#{node['mysql56_server_root_password']}\" \
    --single-transaction --flush-logs --all-databases --master-data=2 > ./setting-repl-master.dump
    EOH
		not_if "test -f #{node['mysql56_server_conf_dir']}/setting-repl-master.dump"
		notifies :create, "ruby_block[check-snapshot(mysqldump) 'master']", :immediately
  end

  ruby_block "check-snapshot(mysqldump) \'master\'" do
    block do
			puts "\n---------------------------------"
			puts "## dump file info"
			puts `LANG=C; ls -lh #{node['mysql56_server_conf_dir']}/setting-repl-master.dump` 
			puts "\n---------------------------------"
		end
		action :nothing
  end

  (slave_ip | bkup_ip).each do |s|
   scp "#{node['mysql56_server_conf_dir']}/setting-repl-master.dump" do
     dest_host s
   end
  end

	scp_user "remove scp-user (send dump-data to slave or bkup)"  do
    action :remove
  end
end
