maintainer       "Xseed Co., Ltd."
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Installs / Configures PHP-5.4"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "php54", "Install and Configuration PHP-5.4"
recipe           "php54::uninstall", "Uninstall PHP-5.4"
supports         ["redhat"]

## for cloudrop inputs
## the following attribute are required.
attribute      'php54_php_version',
  :display_name => "PHP Version ",
  :description => " PHP Version",
  :type => "string",
  :choice => [ '5.4.12-1.el5.maql' ],
  :recipes => [ 'php54' ],
  :default => "5.4.12-1.el5.maql"

attribute      'php54_php-pear_version',
  :display_name => "PHP PEAR Version ",
  :description => " PHP PEAR Version",
  :type => "string",
  :choice => [ '1.9.4-1.el5.maql' ],
  :recipes => [ 'php54' ],
  :default => "1.9.4-1.el5.maql"

attribute      'php54_php-pecl-memcache_version',
  :display_name => "PHP PECL Memcache Version ",
  :description => " PHP PECL Memcache Version",
  :type => "string",
  :choice => [ '2.2.7-1.el5.maql' ],
  :recipes => [ 'php54' ],
  :default => "2.2.7-1.el5.maql"

attribute      'php54_php-pecl-yaml_version',
  :display_name => "PHP PECL Yaml Version ",
  :description => " PHP PECL Yaml Version",
  :type => "string",
  :choice => [ '1.1.0-1.el5.maql' ],
  :recipes => [ 'php54' ],
  :default => "1.1.0-1.el5.maql"

attribute      'php54_php-pecl-apr_version',
  :display_name => "PHP PECL APR Version ",
  :description => " PHP PECL APR Version",
  :type => "string",
  :choice => [ '3.1.13-1.el5.maql' ],
  :recipes => [ 'php54' ],
  :default => "3.1.13-1.el5.maql"

attribute      'php54_php-eaccelerator_version',
  :display_name => "PHP eaccelerator Version ",
  :description => " PHP eaccelerator Version",
  :type => "string",
  :choice => [ '1.0-0.6.42067ac.el5.maql' ],
  :recipes => [ 'php54' ],
  :default => "1.0-0.6.42067ac.el5.maql"

attribute      'php54_MAQL_Select_Modules',
  :display_name => "PHP Select Module ",
  :description => " PHP Select Module",
  :type => "string",
  :recipes => [ 'php54' ]

attribute      'php54_MAQL_Select_MySQL_Module',
  :display_name => "PHP Select MySQL Module ",
  :description => " PHP Select MySQL Module",
  :type => "string",
  :recipes => [ 'php54' ],
  :default => "php54-mysql"

attribute      'php54_MAQL_Select_Accelerator_Module',
  :display_name => "PHP Select Accelerator Module ",
  :description => " PHP Select Accelerator Module",
  :type => "string",
  :recipes => [ 'php54' ],
  :default => "php54-eaccelerator"
