#
# Cookbook Name:: fluentd
# Attribute:: default
#
default['fluentd_version'] = "1.1.11-1.el5.maql"
default['fluent-agent-lite_version'] = "0.6-1.el5.maql"

## td-agent.conf
default['fluentd_td-agent_builtin_in_tcp_port'] = 24224
default['fluentd_td-agent_plugin_in_http_port'] = 8888
default['fluentd_td-agent_builtin_out_tdlog_apikey'] = ""

## fluent-agent-lite.conf
default['fluentd_fluent-agent-lite_TAG_PREFIX'] = ""
default['fluentd_fluent-agent-lite_LOGS'] = "apache2.access  /var/log/httpd/access_log\napache2.error  /var/log/httpd/error_log"
default['fluentd_fluent-agent-lite_PRIMARY_SERVER'] = "localhost"
default['fluentd_fluent-agent-lite_PRIMARY_SERVER_PORT'] = 24224
default['fluentd_fluent-agent-lite_SECONDARY_SERVER'] = "localhost"
default['fluentd_fluent-agent-lite_SECONDARY_SERVER_PORT'] = 24224
