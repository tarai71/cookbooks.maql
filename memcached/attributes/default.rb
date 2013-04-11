#
# Cookbook Name:: memcached
# Attribute:: default
#
default['memcached_package_name'] = "memcached"
default['memcached_version'] = "1.4.15-1.el5.maql"

## /etc/sysconfig/memcached
default['memcached_PORT'] = "11211"
default['memcached_USER'] = "nobody"
default['memcached_MAXCONN'] = "1024"
default['memcached_CACHESIZE'] = "4096"
default['memcached_OPTIONS'] = ""
