maintainer       "Xseed Co., Ltd."
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Installs / Configures apache2"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "apache2", "Install and Configuration Apache2"
recipe           "apache2::config_vhost", "Configuration VirtualHost"
recipe           "apache2::uninstall", "Uninstall Apache2"
supports         ["redhat"]

## for cloudrop inputs
## the following attribute are required.
attribute      'apache2_httpd_version',
  :display_name => "httpd Version ",
  :description => "httpd Version",
  :type => "string",
  :choice => [ '2.2.23-1.el5.maql' ],
  :recipes => [ 'apache2' ],
  :default => "2.2.23-1.el5.maql"

attribute      'apache2_apr_version',
  :display_name => "apr Version",
  :description => "apr Version",
  :type => "string",
  :choice => [ '1.4.6-1.el5.maql' ],
  :recipes => [ 'apache2' ],
  :default => "1.4.6-1.el5.maql"

attribute      'apache2_apr-util_version',
  :display_name => "apr-util Version",
  :description => "apr-util Version",
  :type => "string",
  :choice => [ '1.5.1-1.el5.maql' ],
  :recipes => [ 'apache2' ],
  :default => "1.5.1-1.el5.maql"

attribute      'apache2_Timeout',
  :display_name => "Timeout",
  :description => "httpd.conf - Timeout",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "60"

attribute      'apache2_KeepAlive',
  :display_name => "KeepAlive",
  :description => "httpd.conf - KeepAlive",
  :type => "string",
  :recipes => [ 'On','Off' ],
  :default => "Off"

attribute      'apache2_MaxKeepAliveRequests',
  :display_name => "MaxKeepAliveRequests",
  :description => "httpd.conf - MaxKeepAliveRequests",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "100"

attribute      'apache2_MaxKeepAliveTimeout',
  :display_name => "MaxKeepAliveTimeout",
  :description => "httpd.conf - MaxKeepAliveTimeout",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "15"

attribute      'apache2_prefork_c_StartServers',
  :display_name => "prefork - StartServers",
  :description => "httpd.conf - prefork - StartServers",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "8"

attribute      'apache2_prefork_c_MinSpareServers',
  :display_name => "prefork - MinSpareServers",
  :description => "httpd.conf - prefork - MinSpareServers",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "5"

attribute      'apache2_prefork_c_MaxSpareServers',
  :display_name => "prefork - MaxSpareServers",
  :description => "httpd.conf - prefork - MaxSpareServers",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "20"

attribute      'apache2_prefork_c_ServerLimit',
  :display_name => "prefork - ServerLimit",
  :description => "httpd.conf - prefork - ServerLimit",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "256"

attribute      'apache2_prefork_c_MaxRequestsPerChild',
  :display_name => "prefork - MaxRequestsPerChild",
  :description => "httpd.conf - prefork - MaxRequestsPerChild",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "4000"

attribute      'apache2_DocumentRoot',
  :display_name => "DocumentRoot",
  :description => "httpd.conf - DocumentRoot",
  :type => "string",
  :recipes => [ 'apache2' ],
  :default => "/var/www/html"

attribute      'apach2_LoadModule_MAQL-Select',
  :display_name => "Additional LoadModule",
  :description => "httpd.conf - LoadModule (Additional)",
  :type => "array",
  :choice => [ "auth_basic","authz_user","authz_dbm","proxy","proxy_http","proxy_connect","ssl" ],
  :recipes => [ 'apache2' ]


