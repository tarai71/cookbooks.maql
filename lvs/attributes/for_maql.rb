#
# Cookbook Name:: lvs
# Attribute:: for_maql
#

## for MAQL
dbs = {}

## - db1
default['lvs_game_db1_master_vip'] = ""
default['lvs_game_db1_slave_vip'] = ""
default['lvs_game_db1_bkup_vip'] = ""
default['lvs_game_db1_master_rip'] = ""
default['lvs_game_db1_slave_rip'] = ""
default['lvs_game_db1_bkup_rip'] = ""
game_db1_enable = !(node['lvs_game_db1_master_vip'].split(/\s*,\s*/) | 
                    node['lvs_game_db1_slave_vip'].split(/\s*,\s*/) | 
                    node['lvs_game_db1_bkup_vip'].split(/\s*,\s*/) |
                    node['lvs_game_db1_master_rip'].split(/\s*,\s*/) |
                    node['lvs_game_db1_slave_rip'].split(/\s*,\s*/) |
                    node['lvs_game_db1_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["game_db1"] = { 
                   master_vip: node['lvs_game_db1_master_vip'].split(/\s*,\s*/),
                   slave_vip:  node['lvs_game_db1_slave_vip'].split(/\s*,\s*/),
                   bkup_vip:  node['lvs_game_db1_bkup_vip'].split(/\s*,\s*/),
                   master_rip: node['lvs_game_db1_master_rip'].split(/\s*,\s*/),
                   slave_rip: node['lvs_game_db1_slave_rip'].split(/\s*,\s*/),
                   bkup_rip: node['lvs_game_db1_bkup_rip'].split(/\s*,\s*/)
                 } if game_db1_enable

## - db2
default['lvs_user_db2_master_vip'] = ""
default['lvs_user_db2_slave_vip'] = ""
default['lvs_user_db2_bkup_vip'] = ""
default['lvs_user_db2_master_rip'] = ""
default['lvs_user_db2_slave_rip'] = ""
default['lvs_user_db2_bkup_rip'] = ""
user_db2_enable = !(node['lvs_user_db2_master_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db2_slave_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db2_bkup_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db2_master_rip'].split(/\s*,\s*/) |
                    node['lvs_user_db2_slave_rip'].split(/\s*,\s*/) |  
                    node['lvs_user_db2_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["user_db2"] = { 
                   master_vip: node['lvs_user_db2_master_vip'].split(/\s*,\s*/),
                   slave_vip:  node['lvs_user_db2_slave_vip'].split(/\s*,\s*/),
                   bkup_vip:  node['lvs_user_db2_bkup_vip'].split(/\s*,\s*/),
                   master_rip: node['lvs_user_db2_master_rip'].split(/\s*,\s*/),
                   slave_rip: node['lvs_user_db2_slave_rip'].split(/\s*,\s*/),
                   bkup_rip: node['lvs_user_db2_bkup_rip'].split(/\s*,\s*/)
                 } if user_db2_enable

## - db3
default['lvs_user_db3_master_vip'] = ""
default['lvs_user_db3_slave_vip'] = ""
default['lvs_user_db3_bkup_vip'] = ""
default['lvs_user_db3_master_rip'] = ""
default['lvs_user_db3_slave_rip'] = ""
default['lvs_user_db3_bkup_rip'] = ""
user_db3_enable = !(node['lvs_user_db3_master_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db3_slave_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db3_bkup_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db3_master_rip'].split(/\s*,\s*/) |
                    node['lvs_user_db3_slave_rip'].split(/\s*,\s*/) |  
                    node['lvs_user_db3_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["user_db3"] = { 
                   master_vip: node['lvs_user_db3_master_vip'].split(/\s*,\s*/),
                   slave_vip:  node['lvs_user_db3_slave_vip'].split(/\s*,\s*/),
                   bkup_vip:  node['lvs_user_db3_bkup_vip'].split(/\s*,\s*/),
                   master_rip: node['lvs_user_db3_master_rip'].split(/\s*,\s*/),
                   slave_rip: node['lvs_user_db3_slave_rip'].split(/\s*,\s*/),
                   bkup_rip: node['lvs_user_db3_bkup_rip'].split(/\s*,\s*/)
                 } if user_db3_enable

## - db4
default['lvs_user_db4_master_vip'] = ""
default['lvs_user_db4_slave_vip'] = ""
default['lvs_user_db4_bkup_vip'] = ""
default['lvs_user_db4_master_rip'] = ""
default['lvs_user_db4_slave_rip'] = ""
default['lvs_user_db4_bkup_rip'] = ""
user_db4_enable = !(node['lvs_user_db4_master_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db4_slave_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db4_bkup_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db4_master_rip'].split(/\s*,\s*/) | 
                    node['lvs_user_db4_slave_rip'].split(/\s*,\s*/) |
                    node['lvs_user_db4_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["user_db4"] = { 
                   master_vip: node['lvs_user_db4_master_vip'].split(/\s*,\s*/),
                   slave_vip:  node['lvs_user_db4_slave_vip'].split(/\s*,\s*/),
                   bkup_vip:  node['lvs_user_db4_bkup_vip'].split(/\s*,\s*/),
                   master_rip: node['lvs_user_db4_master_rip'].split(/\s*,\s*/),
                   slave_rip: node['lvs_user_db4_slave_rip'].split(/\s*,\s*/),
                   bkup_rip: node['lvs_user_db4_bkup_rip'].split(/\s*,\s*/)
                 } if user_db4_enable

## - db5
default['lvs_user_db5_master_vip'] = ""
default['lvs_user_db5_slave_vip'] = ""
default['lvs_user_db5_bkup_vip'] = ""
default['lvs_user_db5_master_rip'] = ""
default['lvs_user_db5_slave_rip'] = ""
default['lvs_user_db5_bkup_rip'] = ""
user_db5_enable = !(node['lvs_user_db5_master_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db5_slave_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db5_bkup_vip'].split(/\s*,\s*/) |
                    node['lvs_user_db5_master_rip'].split(/\s*,\s*/) | 
                    node['lvs_user_db5_slave_rip'].split(/\s*,\s*/) |  
                    node['lvs_user_db5_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["user_db5"] = { 
                   master_vip: node['lvs_user_db5_master_vip'].split(/\s*,\s*/),
                   slave_vip:  node['lvs_user_db5_slave_vip'].split(/\s*,\s*/),
                   bkup_vip:  node['lvs_user_db5_bkup_vip'].split(/\s*,\s*/),
                   master_rip: node['lvs_user_db5_master_rip'].split(/\s*,\s*/),
                   slave_rip: node['lvs_user_db5_slave_rip'].split(/\s*,\s*/),
                   bkup_rip: node['lvs_user_db5_bkup_rip'].split(/\s*,\s*/)
                 } if user_db5_enable

## - db6
default['lvs_logging_db6_master_vip'] = ""
default['lvs_logging_db6_slave_vip'] = ""
default['lvs_logging_db6_bkup_vip'] = ""
default['lvs_logging_db6_master_rip'] = ""
default['lvs_logging_db6_slave_rip'] = ""
default['lvs_logging_db6_bkup_rip'] = ""
logging_db6_enable = !(node['lvs_logging_db6_master_vip'].split(/\s*,\s*/) |
                    node['lvs_logging_db6_slave_vip'].split(/\s*,\s*/) | 
                    node['lvs_logging_db6_bkup_vip'].split(/\s*,\s*/) |
                    node['lvs_logging_db6_master_rip'].split(/\s*,\s*/) | 
                    node['lvs_logging_db6_slave_rip'].split(/\s*,\s*/) |  
                    node['lvs_logging_db6_bkup_rip'].split(/\s*,\s*/)).empty?
dbs["logging_db6"] = { 
                   master_vip: node['lvs_logging_db6_master_vip'].split(/\s*,\s*/),
                   slave_vip:  node['lvs_logging_db6_slave_vip'].split(/\s*,\s*/),
                   bkup_vip:  node['lvs_logging_db6_bkup_vip'].split(/\s*,\s*/),
                   master_rip: node['lvs_logging_db6_master_rip'].split(/\s*,\s*/),
                   slave_rip: node['lvs_logging_db6_slave_rip'].split(/\s*,\s*/),
                   bkup_rip: node['lvs_logging_db6_bkup_rip'].split(/\s*,\s*/)
                 } if logging_db6_enable

## - db collections
normal['lvs_dbs_hash'] = dbs

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
normal['lvs_self_db_group'] = self_db_group

## - lvs
default['lvs_vrrp_active_rip'] = ""
default['lvs_vrrp_standby_rip'] = ""
normal['lvs_lvs_array'] = node['lvs_vrrp_active_rip'].split | node['lvs_vrrp_standby_rip'].split
