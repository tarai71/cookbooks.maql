#
# Cookbook Name:: fluentd
# Recipe:: uninstall_fluent-agent-lite
#

## stop
service "fluent-agent-lite" do
	action :stop
end

## uninstall
yum_package "fluent-agent-lite" do
	action :remove
end

