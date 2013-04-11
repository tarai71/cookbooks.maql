#
# Cookbook Name:: fluentd
# Recipe:: td-agent
#

## td-agent
yum_package "td-agent" do
	version node['td-agent_version']
	action :install
	flush_cache [ :before ]
end

## fluent-plugin-file-alternative
execute "install fluent-plugin-file-alternative" do
	command "/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-file-alternative"
	not_if "/usr/lib64/fluent/ruby/bin/fluent-gem list |grep fluent-plugin-file-alternative"
end

## /etc/td-agent/td-agent.conf
template "/etc/td-agent/td-agent.conf" do
  mode "0644"
  source "td-agent.conf.erb"
end

## service
service "td-agent" do
	supports :start => true, :stop => true, :restart => true, :reload => true, :enable => true
  action [ :enable, :start ]
  subscribes :restart, resources(:template => "/etc/td-agent/td-agent.conf")
end

