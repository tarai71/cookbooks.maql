#
# Cookbook Name:: apache2
# Attribute:: default
#
### apr
default['apache2_apr_package'] = "apr"
default['apache2_apr_version'] = "1.4.6-1.el5.maql"

### apr-util
default['apache2_apr-util_package'] = "apr-util"
default['apache2_apr-util_version'] = "1.5.1-1.el5.maql"

### apache2
default['apache2_httpd_package'] = "httpd"
default['apache2_httpd_version'] = "2.2.23-1.el5.maql"

### mod_ssl
default['apache2_mod_ssl_package'] = "mod_ssl"
default['apache2_mod_ssl_version'] = node['apache2_httpd_version']

