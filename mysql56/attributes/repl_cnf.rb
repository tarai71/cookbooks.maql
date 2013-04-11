#
# Cookbook Name:: mysql56
# Attribute:: repl_cnf
#

default['mysql56_mysqld_read_only'] = "0"
default['mysql56_mysqld_rpl_semi_sync_master_enabled'] = "1"
default['mysql56_mysqld_rpl_semi_sync_master_timeout'] = "10"
default['mysql56_mysqld_rpl_semi_sync_slave_enabled'] = "1"
default['mysql56_mysqld_slave_net_timeout'] = "30"
default['mysql56_mysqld_slave_compressed_protocol'] = "1"
