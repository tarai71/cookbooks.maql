maintainer       "Xseed Co., Ltd."
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Installs / Configures MySQL5.6"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "mysql56", "Install and Configuration mysql56-server"
recipe           "mysql56::client", "Install and Configuration mysql56-client"
recipe           "mysql56::config_repl_common", "Replication Common Settings for Master and Slave"
recipe           "mysql56::config_repl_master", "Replication Common Settings for Master"
recipe           "mysql56::config_repl_slave", "Replication Common Settings for Slave"
recipe           "mysql56::uninstall", "Uninstall mysql56-server"
recipe           "mysql56::uninstall_client", "Uninstall mysql56-client"
supports         ["redhat"]

## for cloudrop inputs
## the following attribute are required.
attribute      'mysql56_version',
  :display_name => "MySQL5.6 Version",
  :description => "MySQL5.6 Version",
  :type => "string",
  :choice => [ '5.6.10-1.el5.maql' ],
  :recipes => [ 'mysql56','client' ],
  :default => "5.6.10-1.el5.maql"

attribute       "mysql56_server_root_password",
  :display_name => "MySQL5.6 \"root\" User Password",
  :description => "MySQL5.6 \"root\" User Password",
  :type => "string",
  :recipes => [ 'mysql56','config_repl_common','config_repl_master','config_repl_slave' ]

attribute       "mysql56_server_appuser_password",
  :display_name => "MySQL5.6 \"appuser\" User Password ",
  :description => "MySQL5.6 \"appuser\" User Password",
  :type => "string",
  :recipes => [ 'mysql56' ]

attribute       "mysql56_server_repl_password",
  :display_name => "MySQL5.6 \"repl\" User Password ",
  :description => "MySQL5.6 \"repl\" User Password",
  :type => "string",
  :recipes => [ 'config_repl_master','config_repl_slave' ]

## /etc/my.cnf memory tuning
attribute       "mysql56_mysqld_innodb_buffer_pool_size",
  :display_name => "MySQL5.6 Innodb buffer pool size",
  :description => "- /etc/my.cnf : innodb_buffer_pool_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "8196M"

attribute       "mysql56_mysqld_key_buffer_size",
  :display_name => "MySQL5.6 Key buffer size",
  :description => "- /etc/my.cnf : key_buffer_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "64M"

attribute       "mysql56_mysqld_read_buffer_size",
  :display_name => "MySQL5.6 Read buffer size",
  :description => "- /etc/my.cnf : read_buffer_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "8M"

attribute       "mysql56_mysqld_sort_buffer_size",
  :display_name => "MySQL5.6 Sort buffer size",
  :description => "- /etc/my.cnf : sort_buffer_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "8M"

attribute       "mysql56_mysqld_join_buffer_size",
  :display_name => "MySQL5.6 Join buffer size",
  :description => "- /etc/my.cnf : join_buffer_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "256K"

attribute       "mysql56_mysqld_max_connections",
  :display_name => "MySQL5.6 Max connections",
  :description => "- /etc/my.cnf : max_connections",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "500"

## /etc/my.cnf cache tuning
attribute       "mysql56_mysqld_thread_cache_size",
  :display_name => "MySQL5.6 Thread cache size",
  :description => "- /etc/my.cnf : thread_cache_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "16"

attribute       "mysql56_mysqld_query_cache_size",
  :display_name => "MySQL5.6 Query cache size",
  :description => "- /etc/my.cnf : query_cache_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "64M"

attribute       "mysql56_mysqld_table_open_cache",
  :display_name => "MySQL5.6 Table open cache",
  :description => "- /etc/my.cnf : table_open_cache",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "2048"

attribute       "mysql56_mysqld_wait_timeout",
  :display_name => "MySQL5.6 Wait Timeout",
  :description => "- /etc/my.cnf : wait_timeout",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "50"

## /etc/my.cnf log settings
attribute       "mysql56_mysqld_max_binlog_size",
  :display_name => "MySQL5.6 Max binlog size",
  :description => "- /etc/my.cnf : max_binlog_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "200M"

attribute       "mysql56_mysqld_innodb_log_file_size",
  :display_name => "MySQL5.6 Innodb log file size",
  :description => "- /etc/my.cnf : innodb_log_file_size",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "1024M"

attribute       "mysql56_mysqld_slow_query_log",
  :display_name => "MySQL5.6 Enable slow query log",
  :description => "- /etc/my.cnf : slow_query_log",
  :type => "string",
  :recipes => [ 'mysql56' ],
  :default => "1"

## Replication
attribute       "mysql56_server_master_rip",
  :display_name => "MySQL5.6 Replication Master RIP",
  :description => "MySQL5.6 Replication Master RIP",
  :type => "string",
  :recipes => [ 'config_repl_master','config_repl_slave' ]

attribute       "mysql56_server_slave_rip",
  :display_name => "MySQL5.6 Replication Slave RIP",
  :description => "MySQL5.6 Replication Slave RIP",
  :type => "string",
  :recipes => [ 'config_repl_master','config_repl_slave' ]

attribute       "mysql56_server_bkup_rip",
  :display_name => "MySQL5.6 Replication Backup RIP",
  :description => "MySQL5.6 Replication Backup RIP",
  :type => "string",
  :recipes => [ 'config_repl_master','config_repl_slave' ]

