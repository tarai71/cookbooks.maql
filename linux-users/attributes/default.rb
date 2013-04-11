#
# Cookbook Name:: linux-users
# Attribute:: default
#
### for cloudrop
require 'yaml'
default['linux-users_manage_users'] = ""
default['linux-users_delete_users'] = ""
default['linux-users']['manage']['users'] = YAML::load(node['linux-users_manage_users'])
default['linux-users']['delete']['users'] = YAML::load(node['linux-users_delete_users'])

### example
#default['linux-users_manage_users'] =<<-EOH
#- username: h-goto
#  uid: 1002
#  gid: 1002
#  password: password
#  ssh_public: ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2j3QPkQJj6Ja98ZDRoDId9O+Dv+0G+/F0NiUyaFT0wy7JuS7VxNS011ZLiJpWJlddO4UbEyCBrV6MApZiTvqzGgooG3gHoARmII8id6SD3Z5Gxo+NVbaK0XM/0oJsFAsCdNTdGPV3K7U8Z5rTNZtqPwieHOIZ2vxNYkQIGkIvStOwVaRGTrf7keangIRXxKfl8aOMRgm9T0ORl7JOtxElGKYC2lznnMYNFZ0FWjgLWhxdSGhzHQ9dVnULa6CT/A+KoZQMpu9lNTIYIgF7KbPqw4M244FSEYI3A8kexGLGKB7UiRbCQUil6GQEJAPFkarkDn2ObAHfD57pWZYi/c0mw== h-goto@chef
#- username: s-kusano
#  password: password
#EOH

#default['linux-users_delete_users'] =<<-EOH
#- username: h-goto
#- username: s-kusano
#EOH
