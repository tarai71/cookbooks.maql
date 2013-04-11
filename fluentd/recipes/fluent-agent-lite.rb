#
# Cookbook Name:: fluentd
# Recipe:: fluent-agent-lite
#

## install
yum_package "fluent-agent-lite" do
	version node['fluent-agent-lite_version']
	action :install
	flush_cache [ :before ]
end

## /etc/fluent-agent-lite.conf
template "/etc/fluent-agent-lite.conf" do
  mode "0644"
  source "fluent-agent-lite.conf.erb"
end

## service
service "fluent-agent-lite" do
	supports  :start => true, :stop => true, :restart => true, :enable => true
  action [ :enable, :start ]
  subscribes :restart, resources(:template => "/etc/fluent-agent-lite.conf")
end
