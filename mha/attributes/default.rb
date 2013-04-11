#
# Cookbook Name:: mha
# Attribute:: default
#

## base
default['mha_manager_package_name'] = "mha4mysql55-manager"
default['mha_manager_version'] = "0.55-1.el5.maql"
default['mha_node_package_name'] = "mha4mysql55-node"
default['mha_node_version'] = "0.54-1.el5.maql"
default['mha_mysql_server_root_password'] = "password"

## /etc/masterha_default.cnf
default['mha_mysql_mha_password'] = "password"
default['mha_manager_workdir'] = "/var/tmp/masterha"
default['mha_manager_log'] = "/var/log/masterha/masterha.log"
default['mha_remote_workdir'] = "/var/tmp/masterha"
default['mha_mysql_binlog_dir'] = "/var/lib/mysql"

## init
default['mha_dbs'] = {}
default['mha_lvs'] = []
