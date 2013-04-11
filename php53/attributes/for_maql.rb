#
# Cookbook Name:: php53
# Attribute:: for_maql
#

## Default Bundle Modules
default['php53_MAQL_Default_Modules'] = %w(
php53-cli
php53-common
php53-pear
php53-embedded
php53-enchant
php53-gd
php53-intl
php53-mbstring
php53-mcrypt
php53-pdo
php53-process
php53-recode
php53-snmp
php53-soap
php53-sqlite
php53-tidy
php53-xml
php53-xmlrpc
php53-pecl-memcache
)

## Selective Modules
default['php53_MAQL_Select_Modules'] = []
#default['php53_MAQL_Select_Modules'] = %w(
#php53-bcmath
#php53-dba
#php53-devel
#php53-ldap
#php53-mssql
#php53-odbc
#php53-pgsql
#php53-pspell
#php53-pecl-yaml
#)
#php53-debugingo
#)

## Selective MySQL Module
default['php53_MAQL_Select_MySQL_Module'] = "php53-mysql" # or "php-mysqlnd"

## Selective Accelerator Modules
#default['php53_MAQL_Select_Accelerator_Module'] = "php53-pecl-apc"  # or "php53-eaccelerator" 
default['php53_MAQL_Select_Accelerator_Module'] = "php53-eaccelerator" 

## Define Modules
default['php53_Modules'] = node['php53_MAQL_Default_Modules'] | node['php53_MAQL_Select_Modules'] 
default['php53_Modules'] << node['php53_MAQL_Select_MySQL_Module'] 
default['php53_Modules'] << node['php53_MAQL_Select_Accelerator_Module'] 
default['php53_Modules'].compact!
