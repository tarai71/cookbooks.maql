#
# Cookbook Name:: lvs
# Attribute:: default
#

## base
default['lvs_ipvsadm_version'] = "1.24-20.1.el5.maql"
default['lvs_keepalived_version'] = "1.2.7-1.el5.maql"
default['lvs_keepalived_options'] = "-S 1 -d -f /etc/keepalived/keepalived.conf --check --vrrp"
default['lvs_nagios_plugins_version'] = "1.4.16-2.el5.maql"

## /etc/keepalived/keepalived.conf
default['lvs_vrrp_interface'] = "eth1"
default['lvs_vrrp_address'] = ""
default['lvs_mysql_root_password'] = ""

## init
default['lvs_dbs_hash'] = {}
default['lvs_lvs_array'] = []
