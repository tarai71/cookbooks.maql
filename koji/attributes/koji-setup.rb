#
# Cookbook Name:: koji
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

default['koji_kojihub.systemname'] = "kojihub"
default['koji_kojiweb.systemname'] = "kojiweb"
default['koji_kojira.systemname'] = "kojira"
default['koji_kojibuilder.systemname'] = "#{node['hostname']}"
default['koji_admin.name'] = "kojiadmin"

default['koji_pg_hba.conf_local_TYPE'] = "local"
default['koji_pg_hba.conf_local_DATABASE'] = "all"
default['koji_pg_hba.conf_local_USER'] = "all"
default['koji_pg_hba.conf_local_CIDR-ADDRESS'] = ""
default['koji_pg_hba.conf_local_METHOD'] = "trust"

default['koji_pg_hba.conf_IPv4_TYPE'] = "host"
default['koji_pg_hba.conf_IPv4_DATABASE'] = "all"
default['koji_pg_hba.conf_IPv4_USER'] = "all"
default['koji_pg_hba.conf_IPv4_CIDR-ADDRESS'] = "127.0.0.1/32"
default['koji_pg_hba.conf_IPv4_METHOD'] = "trust"

default['koji_pg_hba.conf_IPv6_TYPE'] = "host"
default['koji_pg_hba.conf_IPv6_DATABASE'] = "all"
default['koji_pg_hba.conf_IPv6_USER'] = "all"
default['koji_pg_hba.conf_IPv6_CIDR-ADDRESS'] = "::1/128"
default['koji_pg_hba.conf_IPv6_METHOD'] = "trust"

default['koji_certificate_top.dir'] = "/etc/pki/koji"
default['koji_certificate_certs.dir'] = "/etc/pki/koji/certs"
default['koji_certificate_confs.dir'] = "/etc/pki/koji/confs"
default['koji_certificate_private.dir']  = "/etc/pki/koji/private"
default['koji_certificate_caname'] = "kojica"

default['koji_sslcnf_countryName_default'] = "JP"
default['koji_sslcnf_stateOrProvinceName_default'] = "Tokyo"
default['koji_sslcnf_localityName_default'] = "Ebishu"
default['koji_sslcnf_0.organizationName_default'] = "Xseed"
default['koji_sslcnf_organizationalUnitName_default'] = "Solution_Service_Group"
default['koji_sslcnf_commonName_default'] = "#{node['koji_kojiweb.systemname']}"
default['koji_sslcnf_emailAddress_default'] = "hogehoge@example.com"

default['koji_httpd.conf_prefork.c_MaxRequestsPerChild'] = "100"
default['koji_httpd.conf_worker.c_MaxRequestsPerChild'] = "100"

default['koji_ssl.conf_SSLCertificateFile'] = "/etc/pki/koji/certs/#{node['koji_kojihub.systemname']}.crt"
default['koji_ssl.conf_SSLCertificateKeyFile'] = "/etc/pki/koji/certs/#{node['koji_kojihub.systemname']}.key"
default['koji_ssl.conf_SSLCertificateChainFile'] = "/etc/pki/koji/#{node['koji_certificate_caname']}_ca_cert.crt"
default['koji_ssl.conf_SSLCACertificateFile'] = "/etc/pki/koji/#{node['koji_certificate_caname']}_ca_cert.crt"

default['koji_hub.conf_DNUsernameComponent'] = "CN"
default['koji_hub.conf_ProxyDNs'] = "/C=#{node['koji_sslcnf_countryName_default']}/ST=#{node['koji_sslcnf_stateOrProvinceName_default']}/O=#{node['koji_sslcnf_0.organizationName_default']}/OU=#{node['koji_sslcnf_organizationalUnitName_default']}/CN=#{node['koji_sslcnf_commonName_default']}"

default['koji-hub_top.dir'] = "/mnt/koji"
default['koji-hub_repos.dir'] = "/mnt/koji/repos"
default['koji-hub_work.dir'] = "/mnt/koji/work"
default['koji-hub_scratch.dir'] = "/mnt/koji/scratch"

default['koji_koji.conf_server'] = "http://kojihub/kojihub"
default['koji_koji.conf_weburl'] = "http://kojiweb/koji"
default['koji_koji.conf_topurl'] = "http://kojihub/packages"
default['koji_koji.conf_topdir'] = "/mnt/koji"
default['koji_koji.conf_cert'] = "~/.koji/client.pem"
default['koji_koji.conf_ca'] = "~/.koji/clientca.crt"
default['koji_koji.conf_serverca'] = "~/.koji/serverca.crt"

default['kojiadmin_.koji.dir'] = "/home/kojiadmin/.koji"

default['koji_site-defaults.cfg_use_host_resolv'] = "True"
default['koji_site-defaults.cfg_resolv.conf'] = "\"nameserver 8.8.8.8\\n\""

default['koji_web.conf_KojiTheme'] = "kojiweb"
default['koji_web.conf_KojiHubURL'] = "http://kojihub/kojihub"
default['koji_web.conf_KojiFilesURL'] = "http://kojihub/kojifiles"
default['koji_web.conf_WebCert'] = "/etc/kojiweb/kojiweb.pem"
default['koji_web.conf_ClientCA'] = "/etc/kojiweb/clientca.crt"
default['koji_web.conf_KojiHubCA'] = "/etc/kojiweb/kojihubca.crt"
default['koji_web.conf_LoginTimeout'] = "72"
default['koji_web.conf_Secret'] = "maql_secret"
default['koji_web.conf_LibPath'] = "/usr/share/koji-web/lib"

default['koji_kojid.conf_workdir'] = "/mnt/kojibuilder/tmp"
default['koji_kojid.conf_mockdir'] = "/mnt/kojibuilder/mock"
default['koji_kojid.conf_server'] = "http://kojihub/kojihub"
default['koji_kojid.conf_topurl'] = "http://kojihub/kojifiles"
default['koji_kojid.conf_cert'] = "/etc/kojid/client.pem"
default['koji_kojid.conf_ca'] = "/etc/kojid/clientca.crt"
default['koji_kojid.conf_serverca'] = "/etc/kojid/serverca.crt"

default['kojibuilder_top.dir'] = "/mnt/kojibuilder"
default['kojibuilder_tmp.dir'] = "/mnt/kojibuilder/tmp"
default['kojibuilder_mock.dir'] = "/mnt/kojibuilder/mock"

default['koji_kojira.conf_server']  = "http://kojihub/kojihub"
default['koji_kojira.conf_topdir']  = "/mnt/koji"
default['koji_kojira.conf_logfile']  = "/var/log/kojira.log"
default['koji_kojira.conf_with_src']  = "no"
default['koji_kojira.conf_cert']  = "/etc/kojira/client.pem"
default['koji_kojira.conf_ca']  = "/etc/kojira/clientca.crt"
default['koji_kojira.conf_serverca']  = "/etc/kojira/serverca.crt"

default['koji_mash.conf_configdir']  = "/etc/mash"
default['koji_mash.conf_buildhost']  = "http://koji.fedoraproject.org/kojihub"
default['koji_mash.conf_repodir']  = "file:///mnt/koji"
default['koji_mash.conf_use_sqlite']  = "True"
default['koji_mash.conf_use_repoview']  = "False"
