maintainer       "Xseed Co., Ltd."
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Installs/Configures lvs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "lvs", "Main LVS configuration"
recipe           "lvs_db", "iptables settings for datadase server"
recipe           "lvs_web", "routing settings for web server"
supports         ["redhat"]

## for cloudrop inputs
## the following attribute are required.
attribute      'lvs_ipvsadm_version',
  :display_name => "ipvsadm Version",
  :description => "ipvsadm Version",
  :type => "string",
  :choice => [ '1.24-20.1.el5.maql' ],
  :recipes => [ 'lvs' ],
  :default => "1.24-20.1.el5.maql"

attribute       "lvs_keepalived_version",
  :display_name => "Keepalived Version",
  :description => "Keepalived Version",
  :type => "string",
  :choice => [ '1.2.7-1.el5.maql' ],
  :recipes => [ 'lvs' ],
  :default => "1.2.7-1.el5.maql"

attribute       "lvs_nagios_plugins_version",
  :display_name => "Nagios Plugins Version",
  :description => "Nagios Plugins Version",
  :type => "string",
  :choice => [ '1.4.16-2.el5.maql' ],
  :recipes => [ 'lvs' ],
  :default => "1.4.16-2.el5.maql"

attribute       "lvs_vrrp_interface",
  :display_name => "VRRP Interface",
  :description => "VRRP Interface",
  :type => "string",
  :choice => [ 'eth0', 'eth1' ],
  :recipes => [ 'lvs' ],
  :default => "eth1"

attribute       "lvs_vrrp_address",
  :display_name => "VRRP IP",
  :description => "VRRP IP",
  :type => "string",
  :recipes => [ 'lvs','lvs_web' ]

attribute       "lvs_vrrp_active_rip",
  :display_name => "LVS Active RIP",
  :description => "LVS Active RIP",
  :type => "string",
  :recipes => [ 'lvs' ]

attribute       "lvs_vrrp_standby_rip",
  :display_name => "LVS Standby RIP",
  :description => "LVS Standby RIP",
  :type => "string",
  :recipes => [ 'lvs' ]

attribute       "lvs_mysql_root_password",
  :display_name => "MySQL \"root\" user Password" ,
  :description => "MySQL \"root\" user Password" ,
  :type => "string",
  :recipes => [ 'lvs' ]

attribute       "lvs_game_db1_master_vip",
  :display_name => "Game DB#1 Master VIP" ,
  :description => "Game DB#1 Master VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_game_db1_slave_vip",
  :display_name => "Game DB#1 Slave VIP" ,
  :description => "Game DB#1 Slave VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_game_db1_bkup_vip",
  :display_name => "Game DB#1 Backup VIP" ,
  :description => "Game DB#1 Backup VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_game_db1_master_rip",
  :display_name => "Game DB#1 Master RIP" ,
  :description => "Game DB#1 Master RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_game_db1_slave_rip",
  :display_name => "Game DB#1 Slave RIP" ,
  :description => "Game DB#1 Slave RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_game_db1_bkup_rip",
  :display_name => "Game DB#1 Backup RIP" ,
  :description => "Game DB#1 Backup RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db2_master_vip",
  :display_name => "User DB#2 Master VIP" ,
  :description => "User DB#2 Mastar VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db2_slave_vip",
  :display_name => "User DB#2 Slave VIP" ,
  :description => "User DB#2 Slave VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db2_bkup_vip",
  :display_name => "User DB#2 Backup VIP" ,
  :description => "User DB#2 Backup VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db2_master_rip",
  :display_name => "User DB#2 Master RIP" ,
  :description => "User DB#2 Master RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db2_slave_rip",
  :display_name => "User DB#2 Slave RIP" ,
  :description => "User DB#2 Slave RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db2_bkup_rip",
  :display_name => "User DB#2 Backup RIP" ,
  :description => "User DB#2 Backup RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db3_master_vip",
  :display_name => "User DB#3 Master VIP" ,
  :description => "User DB#3 Master VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db3_slave_vip",
  :display_name => "User DB#3 Slave VIP" ,
  :description => "User DB#3 Slave VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db3_bkup_vip",
  :display_name => "User DB#3 Backup VIP" ,
  :description => "User DB#3 Backup VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db3_master_rip",
  :display_name => "User DB#3 Master RIP" ,
  :description => "User DB#3 Master RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db3_slave_rip",
  :display_name => "User DB#3 Slave RIP" ,
  :description => "User DB#3 Slave RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db3_bkup_rip",
  :display_name => "User DB#3 Backup RIP" ,
  :description => "User DB#3 Backup RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db4_master_vip",
  :display_name => "User DB#4 Master VIP" ,
  :description => "User DB#4 Master VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db4_slave_vip",
  :display_name => "User DB#4 Slave VIP" ,
  :description => "User DB#4 Slave VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db4_bkup_vip",
  :display_name => "User DB#4 Backup VIP" ,
  :description => "User DB#4 Backup VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db4_master_rip",
  :display_name => "User DB#4 Master RIP" ,
  :description => "User DB#4 Master RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db4_slave_rip",
  :display_name => "User DB#4 Slave RIP" ,
  :description => "User DB#4 Slave RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db4_bkup_rip",
  :display_name => "User DB#4 Backup RIP" ,
  :description => "User DB#4 Backup RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db5_master_vip",
  :display_name => "User DB#5 Master VIP" ,
  :description => "User DB#5 Master VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db5_slave_vip",
  :display_name => "User DB#5 Slave VIP" ,
  :description => "User DB#5 Slave VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db5_bkup_vip",
  :display_name => "User DB#5 Backup VIP" ,
  :description => "User DB#5 Backup VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_user_db5_master_rip",
  :display_name => "User DB#5 Master RIP" ,
  :description => "User DB#5 Master RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db5_slave_rip",
  :display_name => "User DB#5 Slave RIP" ,
  :description => "User DB#5 Slave RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_user_db5_bkup_rip",
  :display_name => "User DB#5 Backup RIP" ,
  :description => "User DB#5 Backup RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_logging_db6_master_vip",
  :display_name => "Logging DB#6 Master VIP" ,
  :description => "Logging DB#6 Master VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_logging_db6_slave_vip",
  :display_name => "Logging DB#6 Slave VIP" ,
  :description => "Logging DB#6 Slave VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_logging_db6_bkup_vip",
  :display_name => "Logging DB#6 Backup VIP" ,
  :description => "Logging DB#6 Backup VIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_web','lvs_db' ]

attribute       "lvs_logging_db6_master_rip",
  :display_name => "Logging DB#6 Master RIP" ,
  :description => "Logging DB#6 Master RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_logging_db6_slave_rip",
  :display_name => "Logging DB#6 Slave RIP" ,
  :description => "Logging DB#6 Slave RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

attribute       "lvs_logging_db6_bkup_rip",
  :display_name => "Logging DB#6 Backup RIP" ,
  :description => "Logging DB#6 Backup RIP" ,
  :type => "string",
  :recipes => [ 'lvs','lvs_db' ]

