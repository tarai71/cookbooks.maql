#
# Cookbook Name:: yum-repo
# Attributes:: default 
#
## enable
default['yum-repo_maql'] = "enable"
default['yum-repo_epel'] = "enable"

## maql-repo
default['yum-repo_maql_repository_hostname'] = '54.248.217.187'
default['yum-repo_maql-release_enable'] = 1
default['yum-repo_maql-release-debug_enable'] = 0
default['yum-repo_maql-release-source_enable'] = 0
default['yum-repo_maql-testing_enable'] = 0
default['yum-repo_maql-testing-debug_enable'] = 0
default['yum-repo_maql-testing-source_enable'] = 0
default['yum-repo_maql-archive_enable'] = 0
default['yum-repo_maql-archive-debug_enable'] = 0
default['yum-repo_maql-archive-source_enable'] = 0
