default['apache2_logrotate_config'] = <<"EOS"
/var/log/httpd/*.log {
     create 600 apache apache
     compress
     dateext
     ifempty
     daily
     rotate 100
     missingok
     sharedscripts
     postrotate
     /sbin/service httpd reload > /dev/null 2>/dev/null || true
     endscript
}
EOS
