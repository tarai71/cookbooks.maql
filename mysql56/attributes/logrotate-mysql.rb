#
# Cookbook Name:: mysql56
# Attribute:: logrotate-mysql
#
default['mysql56_logrotate-mysql'] =<<EOS
/var/log/mysql/*.log /var/log/mysql/mysqld.err  {
     create 600 mysql mysql
     compress
     dateext
     ifempty
     daily
     rotate 100
     missingok
     sharedscripts
     postrotate
     /sbin/service mysqld reload > /dev/null 2>/dev/null || true
     endscript
}
EOS
