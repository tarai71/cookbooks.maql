#
# Cookbook Name:: mysql55
# Attribute:: default
#
default['mysql55_version'] = "5.5.25a-1.el5.maql"
default['mysql55_server_conf_dir'] = "/var/lib/mysql"

## setting-default.sql
default['mysql55_server_root_password'] = "password"
default['mysql55_server_appuser_password'] = "password"

## setting-replication
default['mysql55_server_master_rip'] = ""
default['mysql55_server_slave_rip'] = ""
default['mysql55_server_bkup_rip'] = ""
