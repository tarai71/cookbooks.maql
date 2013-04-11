#
# Cookbook Name:: apache2
# Attribute:: for_maql
#

## Default Bundle Modules
default['apach2_LoadModule_MAQL-Default'] = %w{
authn_file
authn_alias
authn_default
authz_host
authz_default
include
log_config
logio
env
ext_filter
mime_magic
expires
deflate
headers
usertrack
setenvif
mime
status
autoindex
info
vhost_alias
negotiation
dir
actions
speling
alias
substitute
rewrite
cache
suexec
disk_cache
version
}

## Selective Modules
default['apach2_LoadModule_MAQL-Select'] = %w{
auth_basic
authz_user
authz_dbm
proxy
proxy_http
proxy_connect
ssl
}
default['apache2_LoadModule'] = node['apach2_LoadModule_MAQL-Default'] | node['apach2_LoadModule_MAQL-Select']

## Other Bundle Modules
#auth_digest
#authn_anon
#authn_dbm
#authz_owner
#authz_groupfile
#ldap
#authnz_ldap
#dav
#dav_fs
#userdir
#proxy_balancer
#proxy_ftp
#proxy_ajp
#cgi
#asis
#authn_dbd
#cern_meta
#cgid
#dbd
#dumpio
#filter
#ident
#log_forensic
#unique_id
#}
