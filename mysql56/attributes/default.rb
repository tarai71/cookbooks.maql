#
# Cookbook Name:: mysql56
# Attribute:: default
#
default['mysql56_version'] = "5.6.10-1.el5.maql"
default['mysql56_server_conf_dir'] = "/var/lib/mysql"

## setting-default.sql
default['mysql56_server_root_password'] = "password"
default['mysql56_server_appuser_password'] = "password"

## setting-replication
default['mysql56_server_master_rip'] = ""
default['mysql56_server_slave_rip'] = ""
default['mysql56_server_bkup_rip'] = ""
