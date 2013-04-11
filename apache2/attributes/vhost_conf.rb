#
# Cookbook Name:: apache2
# Attribute:: vhost_conf.rb
#
default['apache2_vhost_config'] = <<"EOS"
#NameVirtualHost *:80
#<VirtualHost *:80>
#   ServerAdmin webmaster@dummy-host.example.com
#   DocumentRoot /www/docs/dummy-host.example.com
#   ServerName dummy-host.example.com
#   ErrorLog logs/dummy-host.example.com-error_log
#   CustomLog logs/dummy-host.example.com-access_log common
#</VirtualHost>
EOS

