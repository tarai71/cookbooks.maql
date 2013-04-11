#
# Cookbook Name:: mha
# Attribute:: for_maql
#

## for MAQL
dbs = {}

## - db1
default['mha_game_db1_master_vip'] = ""
default['mha_game_db1_slave_vip'] = ""
default['mha_game_db1_bkup_vip'] = ""
default['mha_game_db1_master_rip'] = ""
default['mha_game_db1_slave_rip'] = ""
default['mha_game_db1_bkup_rip'] = ""
game_db1_enable = !(node['mha_game_db1_master_vip'].split(/\s*,\s*/) | 
						        node['mha_game_db1_slave_vip'].split(/\s*,\s*/) | 
						        node['mha_game_db1_bkup_vip'].split(/\s*,\s*/) |
	                  node['mha_game_db1_master_rip'].split(/\s*,\s*/) |
						        node['mha_game_db1_slave_rip'].split(/\s*,\s*/) |
						        node['mha_game_db1_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["game_db1"] = { 
	                 master_vip: node['mha_game_db1_master_vip'].split(/\s*,\s*/),
	                 slave_vip:  node['mha_game_db1_slave_vip'].split(/\s*,\s*/),
									 bkup_vip:  node['mha_game_db1_bkup_vip'].split(/\s*,\s*/),
									 master_rip: node['mha_game_db1_master_rip'].split(/\s*,\s*/),
									 slave_rip: node['mha_game_db1_slave_rip'].split(/\s*,\s*/),
									 bkup_rip: node['mha_game_db1_bkup_rip'].split(/\s*,\s*/)
                 } if game_db1_enable

## - db2
default['mha_user_db2_master_vip'] = ""
default['mha_user_db2_slave_vip'] = ""
default['mha_user_db2_bkup_vip'] = ""
default['mha_user_db2_master_rip'] = ""
default['mha_user_db2_slave_rip'] = ""
default['mha_user_db2_bkup_rip'] = ""
user_db2_enable = !(node['mha_user_db2_master_vip'].split(/\s*,\s*/) |
						        node['mha_user_db2_slave_vip'].split(/\s*,\s*/) |
						        node['mha_user_db2_bkup_vip'].split(/\s*,\s*/) |
	                  node['mha_user_db2_master_rip'].split(/\s*,\s*/) |
						        node['mha_user_db2_slave_rip'].split(/\s*,\s*/) |  
						        node['mha_user_db2_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["user_db2"] = { 
	                 master_vip: node['mha_user_db2_master_vip'].split(/\s*,\s*/),
	                 slave_vip:  node['mha_user_db2_slave_vip'].split(/\s*,\s*/),
									 bkup_vip:  node['mha_user_db2_bkup_vip'].split(/\s*,\s*/),
									 master_rip: node['mha_user_db2_master_rip'].split(/\s*,\s*/),
									 slave_rip: node['mha_user_db2_slave_rip'].split(/\s*,\s*/),
									 bkup_rip: node['mha_user_db2_bkup_rip'].split(/\s*,\s*/)
                 } if user_db2_enable

## - db3
default['mha_user_db3_master_vip'] = ""
default['mha_user_db3_slave_vip'] = ""
default['mha_user_db3_bkup_vip'] = ""
default['mha_user_db3_master_rip'] = ""
default['mha_user_db3_slave_rip'] = ""
default['mha_user_db3_bkup_rip'] = ""
user_db3_enable = !(node['mha_user_db3_master_vip'].split(/\s*,\s*/) |
						        node['mha_user_db3_slave_vip'].split(/\s*,\s*/) |
						        node['mha_user_db3_bkup_vip'].split(/\s*,\s*/) |
	                  node['mha_user_db3_master_rip'].split(/\s*,\s*/) |
						        node['mha_user_db3_slave_rip'].split(/\s*,\s*/) |  
						        node['mha_user_db3_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["user_db3"] = { 
	                 master_vip: node['mha_user_db3_master_vip'].split(/\s*,\s*/),
	                 slave_vip:  node['mha_user_db3_slave_vip'].split(/\s*,\s*/),
									 bkup_vip:  node['mha_user_db3_bkup_vip'].split(/\s*,\s*/),
									 master_rip: node['mha_user_db3_master_rip'].split(/\s*,\s*/),
									 slave_rip: node['mha_user_db3_slave_rip'].split(/\s*,\s*/),
									 bkup_rip: node['mha_user_db3_bkup_rip'].split(/\s*,\s*/)
                 } if user_db3_enable

## - db4
default['mha_user_db4_master_vip'] = ""
default['mha_user_db4_slave_vip'] = ""
default['mha_user_db4_bkup_vip'] = ""
default['mha_user_db4_master_rip'] = ""
default['mha_user_db4_slave_rip'] = ""
default['mha_user_db4_bkup_rip'] = ""
user_db4_enable = !(node['mha_user_db4_master_vip'].split(/\s*,\s*/) |
						        node['mha_user_db4_slave_vip'].split(/\s*,\s*/) |
						        node['mha_user_db4_bkup_vip'].split(/\s*,\s*/) |
	                  node['mha_user_db4_master_rip'].split(/\s*,\s*/) | 
						        node['mha_user_db4_slave_rip'].split(/\s*,\s*/) |
						        node['mha_user_db4_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["user_db4"] = { 
	                 master_vip: node['mha_user_db4_master_vip'].split(/\s*,\s*/),
	                 slave_vip:  node['mha_user_db4_slave_vip'].split(/\s*,\s*/),
									 bkup_vip:  node['mha_user_db4_bkup_vip'].split(/\s*,\s*/),
									 master_rip: node['mha_user_db4_master_rip'].split(/\s*,\s*/),
									 slave_rip: node['mha_user_db4_slave_rip'].split(/\s*,\s*/),
									 bkup_rip: node['mha_user_db4_bkup_rip'].split(/\s*,\s*/)
                 } if user_db4_enable

## - db5
default['mha_user_db5_master_vip'] = ""
default['mha_user_db5_slave_vip'] = ""
default['mha_user_db5_bkup_vip'] = ""
default['mha_user_db5_master_rip'] = ""
default['mha_user_db5_slave_rip'] = ""
default['mha_user_db5_bkup_rip'] = ""
user_db5_enable = !(node['mha_user_db5_master_vip'].split(/\s*,\s*/) |
						        node['mha_user_db5_slave_vip'].split(/\s*,\s*/) |
						        node['mha_user_db5_bkup_vip'].split(/\s*,\s*/) |
	                  node['mha_user_db5_master_rip'].split(/\s*,\s*/) | 
						        node['mha_user_db5_slave_rip'].split(/\s*,\s*/) |  
						        node['mha_user_db5_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["user_db5"] = { 
	                 master_vip: node['mha_user_db5_master_vip'].split(/\s*,\s*/),
	                 slave_vip:  node['mha_user_db5_slave_vip'].split(/\s*,\s*/),
									 bkup_vip:  node['mha_user_db5_bkup_vip'].split(/\s*,\s*/),
									 master_rip: node['mha_user_db5_master_rip'].split(/\s*,\s*/),
									 slave_rip: node['mha_user_db5_slave_rip'].split(/\s*,\s*/),
									 bkup_rip: node['mha_user_db5_bkup_rip'].split(/\s*,\s*/)
                 } if user_db5_enable

## - db6
default['mha_logging_db6_master_vip'] = ""
default['mha_logging_db6_slave_vip'] = ""
default['mha_logging_db6_bkup_vip'] = ""
default['mha_logging_db6_master_rip'] = ""
default['mha_logging_db6_slave_rip'] = ""
default['mha_logging_db6_bkup_rip'] = ""
logging_db6_enable = !(node['mha_logging_db6_master_vip'].split(/\s*,\s*/) |
						        node['mha_logging_db6_slave_vip'].split(/\s*,\s*/) | 
						        node['mha_logging_db6_bkup_vip'].split(/\s*,\s*/) |
	                  node['mha_logging_db6_master_rip'].split(/\s*,\s*/) | 
						        node['mha_logging_db6_slave_rip'].split(/\s*,\s*/) |  
						        node['mha_logging_db6_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["logging_db6"] = { 
	                 master_vip: node['mha_logging_db6_master_vip'].split(/\s*,\s*/),
	                 slave_vip:  node['mha_logging_db6_slave_vip'].split(/\s*,\s*/),
									 bkup_vip:  node['mha_logging_db6_bkup_vip'].split(/\s*,\s*/),
									 master_rip: node['mha_logging_db6_master_rip'].split(/\s*,\s*/),
									 slave_rip: node['mha_logging_db6_slave_rip'].split(/\s*,\s*/),
									 bkup_rip: node['mha_logging_db6_bkup_rip'].split(/\s*,\s*/)
                 } if logging_db6_enable

## - db collections
normal['mha_dbs'] = dbs

## - check self db
self_rip = (`LANG=C; ifconfig |grep inet |awk '{print $2}' |cut -d':' -f2 |grep -v 127.0.0.1`).split
self_db_group = "unknown"
dbs.each do |k,v|
	unless (v.values.flatten & self_rip).empty? then
		self_db_group = k
		break
	end
end
#puts "self_db_group = #{self_db_group}"
normal['mha_self_db_group'] = self_db_group

## - lvs
default['mha_lvs_active_rip'] = ""
default['mha_lvs_standby_rip'] = ""
normal['mha_lvs'] = node['mha_lvs_active_rip'].split | node['mha_lvs_standby_rip'].split
