maintainer       "Xseed Co., Ltd."
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Installs/Configures mha"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "masterha_manager", "Main MHA Manager configuration"
recipe           "masterha_node", "Main MHA Node configuration"
recipe           "uninstall_masterha_manager", "Uninstall MHA Manager"
recipe           "uninstall_masterha_node", "Uninstall MHA Node"
supports         ["redhat"]

## for cloudrop inputs
## the following attribute are required.
attribute      'mha_manager_package_name',
  :display_name => "MHA Manager Package Name",
  :description => "MHA Manager Package Name",
  :type => "string",
  :choice => [ 'mha4mysql55-manager','mha4mysql56-manager' ],
  :recipes => [ 'masterha_manager','uninstall_masterha_manager' ],
  :default => "mha4mysql55-manager"

attribute       "mha_manager_version",
  :display_name => "MHA Manager Version",
  :description => "MHA Manager Version",
  :type => "string",
  :choice => [ '0.55-1.el5.maql' ],
  :recipes => [ 'masterha_manager' ],
  :default => "0.55-1.el5.maql"

attribute       "mha_node_package_name",
  :display_name => "MHA Node Package Name",
  :description => "MHA Node Package Name",
  :type => "string",
  :choice => [ 'mha4mysql55-node','mha4mysql56-node' ],
  :recipes => [ 'masterha_manager','masterha_node','uninstall_masterha_manager','uninstall_masterha_node' ],
  :default => "mha4mysql55-node"

attribute       "mha_node_version",
  :display_name => "MHA Node Version",
  :description => "MHA Node Version",
  :type => "string",
  :choice => [ '0.54-1.el5.maql' ],
  :recipes => [ 'masterha_manager','masterha_node' ],
  :default => "0.54-1.el5.maql"

attribute       "mha_mysql_server_root_password",
  :display_name => "MySQL \"root\" user password",
  :description => "MySQL \"root\" user password",
  :type => "string",
  :recipes => [ 'masterha_node' ]

attribute       "mha_mysql_mha_password",
  :display_name => "MySQL \"mha\" user password",
  :description => "MySQL \"mha\" user password",
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_lvs_active_rip",
  :display_name => "LVS Active Node RIP",
  :description => "LVS Active Node RIP",
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_lvs_standby_rip",
  :display_name => "LVS Standby Node RIP",
  :description => "LVS Standby Node RIP",
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_game_db1_master_vip",
  :display_name => "Game DB#1 Master VIP" ,
  :description => "Game DB#1 Master VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_game_db1_slave_vip",
  :display_name => "Game DB#1 Slave VIP" ,
  :description => "Game DB#1 Slave VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_game_db1_bkup_vip",
  :display_name => "Game DB#1 Backup VIP" ,
  :description => "Game DB#1 Backup VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_game_db1_master_rip",
  :display_name => "Game DB#1 Master RIP" ,
  :description => "Game DB#1 Master RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_game_db1_slave_rip",
  :display_name => "Game DB#1 Slave RIP" ,
  :description => "Game DB#1 Slave RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_game_db1_bkup_rip",
  :display_name => "Game DB#1 Backup RIP" ,
  :description => "Game DB#1 Backup RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db2_master_vip",
  :display_name => "User DB#2 Master VIP" ,
  :description => "User DB#2 Mastar VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db2_slave_vip",
  :display_name => "User DB#2 Slave VIP" ,
  :description => "User DB#2 Slave VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db2_bkup_vip",
  :display_name => "User DB#2 Backup VIP" ,
  :description => "User DB#2 Backup VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db2_master_rip",
  :display_name => "User DB#2 Master RIP" ,
  :description => "User DB#2 Master RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db2_slave_rip",
  :display_name => "User DB#2 Slave RIP" ,
  :description => "User DB#2 Slave RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db2_bkup_rip",
  :display_name => "User DB#2 Backup RIP" ,
  :description => "User DB#2 Backup RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db3_master_vip",
  :display_name => "User DB#3 Master VIP" ,
  :description => "User DB#3 Master VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db3_slave_vip",
  :display_name => "User DB#3 Slave VIP" ,
  :description => "User DB#3 Slave VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db3_bkup_vip",
  :display_name => "User DB#3 Backup VIP" ,
  :description => "User DB#3 Backup VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db3_master_rip",
  :display_name => "User DB#3 Master RIP" ,
  :description => "User DB#3 Master RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db3_slave_rip",
  :display_name => "User DB#3 Slave RIP" ,
  :description => "User DB#3 Slave RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db3_bkup_rip",
  :display_name => "User DB#3 Backup RIP" ,
  :description => "User DB#3 Backup RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db4_master_vip",
  :display_name => "User DB#4 Master VIP" ,
  :description => "User DB#4 Master VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db4_slave_vip",
  :display_name => "User DB#4 Slave VIP" ,
  :description => "User DB#4 Slave VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db4_bkup_vip",
  :display_name => "User DB#4 Backup VIP" ,
  :description => "User DB#4 Backup VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db4_master_rip",
  :display_name => "User DB#4 Master RIP" ,
  :description => "User DB#4 Master RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db4_slave_rip",
  :display_name => "User DB#4 Slave RIP" ,
  :description => "User DB#4 Slave RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db4_bkup_rip",
  :display_name => "User DB#4 Backup RIP" ,
  :description => "User DB#4 Backup RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db5_master_vip",
  :display_name => "User DB#5 Master VIP" ,
  :description => "User DB#5 Master VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db5_slave_vip",
  :display_name => "User DB#5 Slave VIP" ,
  :description => "User DB#5 Slave VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db5_bkup_vip",
  :display_name => "User DB#5 Backup VIP" ,
  :description => "User DB#5 Backup VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db5_master_rip",
  :display_name => "User DB#5 Master RIP" ,
  :description => "User DB#5 Master RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db5_slave_rip",
  :display_name => "User DB#5 Slave RIP" ,
  :description => "User DB#5 Slave RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_user_db5_bkup_rip",
  :display_name => "User DB#5 Backup RIP" ,
  :description => "User DB#5 Backup RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_logging_db6_master_vip",
  :display_name => "Logging DB#6 Master VIP" ,
  :description => "Logging DB#6 Master VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_logging_db6_slave_vip",
  :display_name => "Logging DB#6 Slave VIP" ,
  :description => "Logging DB#6 Slave VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_logging_db6_bkup_vip",
  :display_name => "Logging DB#6 Backup VIP" ,
  :description => "Logging DB#6 Backup VIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_logging_db6_master_rip",
  :display_name => "Logging DB#6 Master RIP" ,
  :description => "Logging DB#6 Master RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_logging_db6_slave_rip",
  :display_name => "Logging DB#6 Slave RIP" ,
  :description => "Logging DB#6 Slave RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

attribute       "mha_logging_db6_bkup_rip",
  :display_name => "Logging DB#6 Backup RIP" ,
  :description => "Logging DB#6 Backup RIP" ,
  :type => "string",
  :recipes => [ 'masterha_manager','masterha_node' ]

