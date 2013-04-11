#
# Cookbook Name:: apache2
# Attribute:: ssl_conf.rb
#
default['apache2_SSL_Listen'] = 443
default['apache2_SSLProtocol'] = "all -SSLv2"
default['apache2_SSLCipherSuite'] = "ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:+LOW"
default['apache2_SSLCertificateFile'] = "/etc/httpd/conf/server.crt"
default['apache2_SSLCertificateKeyFile'] = "/etc/httpd/conf/server.key"

