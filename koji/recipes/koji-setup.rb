#
# Cookbook Name:: koji
# Recipe:: default
#
# Copyright 2013, Xseed Co., Ltd.
#
# All rights reserved - Do Not Redistribute
#

#############
# hosts setup
#############
[ node['koji_kojihub.systemname'],
  node['koji_kojiweb.systemname'],
  node['koji_kojira.systemname'],
  node['koji_kojibuilder.systemname'] ].each do |hosts|
bash "hosts" do
  user "root"
  code <<-EOH
  ADDHOST=`cat /etc/hosts | grep 127.0.0.1 | sed -e "s/$/ #{hosts}/g"`
  sed -i '/^127.0.0.1*/d' /etc/hosts
  sed -i "/localhost6/i $ADDHOST" /etc/hosts
  EOH
  not_if "cat /etc/hosts | grep 127.0.0.1 | grep #{hosts}"
 end
end

#############
# epel setup
#############

# verify files
# /var/chef/cookbooks/koji/files/default/RPM-GPG-KEY-EPEL
# rpm --import http://ftp.riken.jp/Linux/fedora/epel/RPM-GPG-KEY-EPEL

# /var/chef/cookbooks/koji/files/default/epel-release-5-4.noarch.rpm
# wget http://ftp.riken.jp/Linux/fedora/epel/5/x86_64/epel-release-5-4.noarch.rpm

cookbook_file "/tmp/epel-release-5-4.noarch.rpm" do
  source "epel-release-5-4.noarch.rpm"
end

cookbook_file "/tmp/RPM-GPG-KEY-EPEL" do
  source "RPM-GPG-KEY-EPEL"
end

execute "epel-setup" do
  command "rpm --import /tmp/RPM-GPG-KEY-EPEL && yum -y install /tmp/epel-release-5-4.noarch.rpm"
  not_if "rpm -q epel-release-5-4"
end

##################
# package install
##################

pkgs = %w(
koji-builder
koji-hub
koji-utils
koji-web
koji
mash
postgresql84
postgresql84-server
httpd
mod_ssl
mod_python
mash
)

pkgs.each do |pkg|
  yum_package pkg do
    action :install
  end
end

##################
# postgresql setup
##################

bash "initdb" do
  user "root"
  code <<-EOH
  /etc/init.d/postgresql initdb
  EOH
  not_if "find /var/lib/pgsql/data/ |grep '/pg_log/'"
end

template "/var/lib/pgsql/data/pg_hba.conf" do
  source "pg_hba.conf.erb"
    owner "postgres"
    group "postgres"
    mode 0600
end

service "postgresql" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

execute "create-database-user-koji" do
    command "createuser --username postgres --no-superuser --no-createdb --no-createrole koji && createdb --username postgres -O koji koji"
    not_if "psql -U koji"
end

execute "create-user-koji" do
  command "useradd koji && passwd -d koji"
  not_if "cat /etc/shadow | grep ^koji::"
end

execute "test" do
    command "su - koji -c 'psql koji koji < /usr/share/doc/koji-1.7.0/docs/schema.sql' && psql -U koji << _EOF
INSERT INTO users (name,status,usertype) VALUES ('kojiadmin',0,0);
INSERT INTO user_perms (user_id,perm_id,creator_id) VALUES (1,1,1);
_EOF"
    not_if "psql -U koji -c 'select * from users'"
end

####################
# certificate setup
####################

[ node['koji_certificate_top.dir'],
  node['koji_certificate_certs.dir'],
  node['koji_certificate_confs.dir'],
  node['koji_certificate_private.dir'] ].each do |ssldir|
  directory ssldir do
  end
end

file "/etc/pki/koji/index.txt" do
  action :create
end

template "/etc/pki/koji/ssl.cnf" do
  source "ssl.cnf.erb"
end

template "/etc/pki/koji/gen_cert_both.sh" do
  source "gen_cert_both.sh.erb"
  mode 755
end

template "/etc/pki/koji/gen_cert_serveronly.sh" do
  source "gen_cert_serveronly.sh.erb"
  mode 755
end

template "/etc/pki/koji/gen_cert_useronly.sh" do
  mode 755
  source "gen_cert_useronly.sh.erb"
end

bash "create_certificates" do
  user "root"
  cwd "/etc/pki/koji"
  code <<-EOH
  if [ ! -e serial ]; then echo 01 > serial ;fi
  openssl genrsa -out /etc/pki/koji/private/#{node['koji_certificate_caname']}_ca_cert.key 2048

  openssl req -config ssl.cnf -new -x509 -subj '/C=#{node['koji_sslcnf_countryName_default']}/ST=#{node['koji_sslcnf_stateOrProvinceName_default']}/L=#{node['koji_sslcnf_localityName_default']}/O=#{node['koji_sslcnf_0.organizationName_default']}/OU=#{node['koji_sslcnf_organizationalUnitName_default']}/CN=#{node['koji_sslcnf_commonName_default']}' -days 3650 -key /etc/pki/koji/private/#{node['koji_certificate_caname']}_ca_cert.key -out /etc/pki/koji/#{node['koji_certificate_caname']}_ca_cert.crt -extensions v3_ca
./gen_cert_serveronly.sh #{node['koji_kojihub.systemname']}
./gen_cert_serveronly.sh #{node['koji_kojiweb.systemname']}
./gen_cert_serveronly.sh #{node['koji_kojira.systemname']}
./gen_cert_serveronly.sh #{node['koji_kojibuilder.systemname']}
./gen_cert_both.sh #{node['koji_admin.name']}
  EOH
not_if "find /etc/pki/koji/certs/ |grep '#{node['koji_admin.name']}_browser_cert.p12'"
end

####################
# koji-hub setup
####################

template "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf.erb"
end

cookbook_file "/etc/httpd/conf.d/kojihub.conf" do
  source "kojihub.conf"
end

template "/etc/httpd/conf.d/ssl.conf" do
  source "ssl.conf.erb"
end

template "/etc/koji-hub/hub.conf" do
  source "hub.conf.erb"
end

cookbook_file "/etc/httpd/conf.d/wsgi.conf" do
  source "wsgi.conf"
end

directory node['koji-hub_top.dir'] do
end

[ node['koji-hub_repos.dir'],
  node['koji-hub_work.dir'],
  node['koji-hub_scratch.dir'] ].each do |hubdir|
  directory hubdir do
  owner "apache"
  group "apache"
  end
end

service "httpd" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

####################
# koji-client setup
####################

template "/etc/koji.conf" do
  source "koji.conf.erb"
end

user "kojiadmin" do
end

bash "kojiadmin-usermod" do
  user "root"
  code <<-EOH
  usermod -G mock,wheel kojiadmin
  EOH
  not_if "id kojiadmin | grep \"mock\" | grep \"wheel\""
end

bash "sudo-wheel" do
  user "root"
  code <<-EOH
  sed -i -e "93i %wheel        ALL=(ALL)       NOPASSWD: ALL" /etc/sudoers
  EOH
  not_if "grep -r \"^%wheel        ALL=(ALL)       NOPASSWD: ALL\" /etc/sudoers"
end

directory "#{node['kojiadmin_.koji.dir']}" do
  owner "kojiadmin"
  group "kojiadmin"
  mode 0775
  action :create
end

bash "client-certificate" do
  user "root"
  code <<-EOH
  cp /etc/pki/koji/kojiadmin.pem /home/kojiadmin/.koji/client.pem
  cp /etc/pki/koji/kojica_ca_cert.crt /home/kojiadmin/.koji/clientca.crt
  cp /etc/pki/koji/kojica_ca_cert.crt /home/kojiadmin/.koji/serverca.crt
  chown kojiadmin. /home/kojiadmin/.koji/*
  EOH
  not_if "find /home/kojiadmin/.koji/ | grep *.crt"
end

####################
# koji-web setup
####################

cookbook_file "/etc/httpd/conf.d/kojiweb.conf" do
  source "kojiweb.conf"
end

service "httpd" do
  action :restart
end

template "/etc/kojiweb/web.conf" do
  source "web.conf.erb"
end

bash "web-certificate" do
  user "root"
  code <<-EOH
  cp /etc/pki/koji/kojiweb.pem /etc/kojiweb/
  cp /etc/pki/koji/kojica_ca_cert.crt /etc/kojiweb/clientca.crt
  cp /etc/pki/koji/kojica_ca_cert.crt /etc/kojiweb/kojihubca.crt
  EOH
  not_if "find /etc/kojiweb/ | grep *.crt"
end

####################
# koji-builder setup
####################

bash "koji-addhost" do
  user "root"
  code <<-EOH
  su -l kojiadmin -c 'koji add-host #{node['koji_kojibuilder.systemname']} x86_64'
  su -l kojiadmin -c 'koji add-host-to-channel #{node['koji_kojibuilder.systemname']} createrepo'
  EOH
  not_if "koji list-hosts | grep #{node['koji_kojibuilder.systemname']}"
end

template "/etc/kojid/kojid.conf" do
  source "kojid.conf.erb"
end

bash "builder-certificate" do
  user "root"
  code <<-EOH
  cp /etc/pki/koji/#{node['koji_kojibuilder.systemname']}.pem /etc/kojid/client.pem
  cp /etc/pki/koji/kojica_ca_cert.crt /etc/kojid/clientca.crt
  cp /etc/pki/koji/kojica_ca_cert.crt /etc/kojid/serverca.crt
  EOH
  not_if "find /etc/kojid/ | grep *.crt"
end

directory node['koji-hub_top.dir'] do
end

[ node['kojibuilder_top.dir'],
  node['kojibuilder_tmp.dir'],
  node['kojibuilder_mock.dir'] ].each do |builderdir|
  directory builderdir do
  owner "kojibuilder"
  group "mock"
  mode 02755
  end
end

template "/etc/mock/site-defaults.cfg" do
  mode 0775
  source "site-defaults.cfg.erb"
end

service "kojid" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

####################
# kojira setup
####################

bash "kojira-user" do
  user "root"
  code <<-EOH
  su -l kojira -c 'koji add-user kojira'
  su -l kojira -c 'koji grant-permission repo kojira'
  EOH
  not_if "koji search user kojira"
end

template "/etc/kojira/kojira.conf" do
  source "kojira.conf.erb"
    owner "root"
    group "root"
    mode 0644
end

bash "kojira-certificate" do
  user "root"
  code <<-EOH
  cp /etc/pki/koji/kojira.pem /etc/kojira/client.pem
  cp /etc/pki/koji/kojica_ca_cert.crt /etc/kojira/clientca.crt
  cp /etc/pki/koji/kojica_ca_cert.crt /etc/kojira/serverca.crt
  EOH
  not_if "find /etc/kojira/ | grep *.crt"
end

service "kojira" do
  supports :restart => true, :status => true, :reload => true
  action [:enable, :start]
end

####################
# koji-log setup
####################

cookbook_file "/etc/logrotate.d/kojid" do
  source "kojid"
    owner "root"
    group "root"
    mode 0644
end

cookbook_file "/etc/logrotate.d/kojira" do
  source "kojira"
    owner "root"
    group "root"
    mode 0644
end

####################
# mash setup
####################

template "/etc/mash/mash.conf" do
  source "mash.conf.erb"
    owner "root"
    group "root"
    mode 0644
end
