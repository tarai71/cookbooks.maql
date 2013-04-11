#
# Cookbook Name:: fluentd
# Recipe:: uninstall_td-agent
#

## uninstall
execute "uninstall fluent-plugin-file-alternative" do
	command "/usr/lib64/fluent/ruby/bin/fluent-gem uninstall fluent-plugin-file-alternative"
	only_if "/usr/lib64/fluent/ruby/bin/fluent-gem list |grep fluent-plugin-file-alternative"
end

yum_package "td-agent" do
	action :remove
end

directory "/etc/td-agent" do
	action :delete
	recursive true
end

