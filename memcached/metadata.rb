maintainer       "Xseed Co., Ltd."
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Installs / Configures Memcached"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "memcached", "Install and Configuration Memcached"
recipe           "memcached::uninstall", "Uninstall Memcached"
supports         ["redhat"]

## for cloudrop inputs
## the following attribute are required.
attribute      'memcached_version',
  :display_name => "Memcached Version",
  :description => "Memcached Version",
  :type => "string",
  :choice => [ '1.4.15-1.el5.maql' ],
  :recipes => [ 'memcached' ],
  :default => "1.4.15-1.el5.maql"

attribute      'memcached_PORT',
  :display_name => "Memcached Port",
  :description => "Memcached Port",
  :type => "string",
  :recipes => [ 'memcached' ],
  :default => "11211"

attribute      'memcached_USER',
  :display_name => "Memcached User",
  :description => "Memcached User",
  :type => "string",
  :recipes => [ 'nobody' ],
  :default => "nobody"

attribute      'memcached_MAXCONN',
  :display_name => "Memcached Max Connection",
  :description => "Memcached Max Connection",
  :type => "string",
  :recipes => [ 'nobody' ],
  :default => "4096"
