#
# Cookbook Name:: yum-repo
# Recipe:: default
#
## maql-repo
if node['yum-repo_maql'] == "enable" then
  template "/etc/yum.repos.d/maql.repo" do
    source "maql.repo.erb"
    owner "root"
    group "root"
    mode 00644
    action :create
  end

else
  file "/etc/yum.repos.d/maql.repo" do
    action :delete
  end

end

## epel-repo
if node['yum-repo_epel'] == "enable" then
  cookbook_file "/tmp/RPM-GPG-KEY-EPEL-5" do
    source "RPM-GPG-KEY-EPEL-5"
    action :create
  end

  execute "import epel-gpg-key" do
    command "rpm --import /tmp/RPM-GPG-KEY-EPEL-5"
    action :run
    not_if 'rpm -qi gpg-pubkey |grep epel'
  end

  cookbook_file "/tmp/epel-release-5-4.noarch.rpm" do
    source "epel-release-5-4.noarch.rpm"
    action :create
  end

  package "epel-release" do
    action :install
    provider Chef::Provider::Package::Rpm
    source "/tmp/epel-release-5-4.noarch.rpm"
    not_if 'rpm -qa |grep epel-release-5-4'
  end
else
  yum_package "epel-release" do
    action :remove
  end

end

