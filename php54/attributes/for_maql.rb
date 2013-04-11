#
# Cookbook Name:: php54
# Attribute:: for_maql
#
## Default Bundle Modules
default['php54_MAQL_Default_Modules'] = %w(
php54-cli
php54-common
php54-pear
php54-embedded
php54-enchant
php54-gd
php54-intl
php54-mbstring
php54-mcrypt
php54-pdo
php54-process
php54-recode
php54-snmp
php54-soap
php54-tidy
php54-xml
php54-xmlrpc
php54-pecl-memcache
)
#php54-pecl-yaml
#)

## Selective Modules
default['php54_MAQL_Select_Modules'] = []
#default['php54_MAQL_Select_Modules'] = %w(
#php54-bcmath
#php54-dba
#php54-devel
#php54-fpm
#php54-imap
#php54-interbase
#php54-ldap
#php54-mssql
#php54-odbc
#php54-pgsql
#php54-pspell
#)
#php54-debugingo
#)

## Selective MySQL Module
default['php54_MAQL_Select_MySQL_Module'] = "php54-mysql" # or "php54-mysqlnd"

## Selective Accelerator Modules
default['php54_MAQL_Select_Accelerator_Module'] = "php54-pecl-apc"  # or "php54-eaccelerator" 

## Define Modules
default['php54_Modules'] = node['php54_MAQL_Default_Modules'] | node['php54_MAQL_Select_Modules'] 
default['php54_Modules'] << node['php54_MAQL_Select_MySQL_Module'] 
default['php54_Modules'] << node['php54_MAQL_Select_Accelerator_Module'] 
default['php54_Modules'].compact!
