maintainer       "Xseed Co., Ltd."
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Installs / Configures fluentd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "fluentd::td-agent", "Install / Configure td-agent"
recipe           "fluentd::fluent-agent-lite", "Install / Configure fluent-agent-lite"
recipe           "fluentd::uninstall_td-agent", "Uninstall td-agent"
recipe           "fluentd::uninstall_fluent-agent-lite", "Uninstall fluent-agent-lite"
supports         ["redhat"]

## for cloudrop inputs
## the following attribute are required.
attribute      'fluentd_version',
  :display_name => "td-agent Version",
  :description => "td-agent Version",
  :type => "string",
  :choice => [ '1.1.11-1.el5.maql' ],
  :recipes => [ 'td-agent' ],
  :default => "1.1.11-1.el5.maql"

attribute      'fluent-agent-lite_version',
  :display_name => "fluent-agent-lite Version",
  :description => "fluent-agent-lite Version",
  :type => "string",
  :choice => [ '0.6-1.el5.maql' ],
  :recipes => [ 'td-agent' ],
  :default => "0.6-1.el5.maql"

attribute      'fluentd_td-agent_builtin_in_tcp_port',
  :display_name => "td-agent builtin in_tcp port",
  :description => "td-agent.conf - type tcp - port",
  :type => "string",
  :recipes => [ 'td-agent' ],
  :default => "24224"

attribute      'fluentd_td-agent_plugin_in_http_port',
  :display_name => "td-agent plugin in_http port",
  :description => "td-agent.conf - type http - port",
  :type => "string",
  :recipes => [ 'td-agent' ],
  :default => "8888"

attribute      'fluentd_td-agent_builtin_out_tdlog_apikey',
  :display_name => "td-agent builtin out_tdlog apikey",
  :description => "td-agent.conf - type tdlog - apikey",
  :type => "string",
  :recipes => [ 'td-agent' ]

attribute      'fluentd_fluent-agent-lite_TAG_PREFIX',
  :display_name => "fluent-agent-lite TAG_PREFIX",
  :description => "fluent-agent-lite.conf - TAG_PREFIX",
  :type => "string",
  :recipes => [ 'fluent-agent-lite' ]

attribute      'fluentd_fluent-agent-lite_LOGS',
  :display_name => "fluent-agent-lite LOGS",
  :description => "fluent-agent-lite.conf - LOGS - ex. yourservice.tag /var/log/yourservice/access.log",
  :type => "string",
  :recipes => [ 'fluent-agent-lite' ],
	:default => "apache2.access  /var/log/httpd/access_log\napache2.error  /var/log/httpd/error_log"

attribute      'fluentd_fluent-agent-lite_PRIMARY_SERVER',
  :display_name => "fluent-agent-lite PRIMARY_SERVER",
  :description => "fluent-agent-lite.conf - PRIMARY_SERVER",
  :type => "string",
  :recipes => [ 'fluent-agent-lite' ],
  :default => "localhost"

attribute      'fluentd_fluent-agent-lite_PRIMARY_SERVER_PORT',
  :display_name => "fluent-agent-lite PRIMARY_SERVER_PORT",
  :description => "fluent-agent-lite.conf - PRIMARY_SERVER_PORT",
  :type => "string",
  :recipes => [ 'fluent-agent-lite' ],
  :default => "24224"

attribute      'fluentd_fluent-agent-lite_SECONDARY_SERVER',
  :display_name => "fluent-agent-lite SECONDARY_SERVER",
  :description => "fluent-agent-lite.conf - SECONDARY_SERVER",
  :type => "string",
  :recipes => [ 'fluent-agent-lite' ],
  :default => "localhost"

attribute      'fluentd_fluent-agent-lite_SECONDARY_SERVER_PORT',
  :display_name => "fluent-agent-lite SECONDARY_SERVER_PORT",
  :description => "fluent-agent-lite.conf - SECONDARY_SERVER_PORT",
  :type => "string",
  :recipes => [ 'fluent-agent-lite' ],
  :default => "24224"
