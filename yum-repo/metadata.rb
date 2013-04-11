maintainer        "Xseed Co., Ltd."
maintainer_email  "h-goto@xseed.co.jp"
license           "Apache 2.0"
description       "Configure (Enable/Disable) MAQL,epel YumRepository"
long_description  "Configure (Enable/Disable) MAQL,epel YumRepository"
version           "0.1.0"
recipe            "yum-repo::default", "Enable/Disable MAQL,epel YumRpository"

## for cloudrop inputs
## the following attribute are required.
attribute 'yum-repo_maql',
  :display_name => "MAQL Yum Repository",
  :description => "Enable MAQL Yum Repository",
  :type => "string",
  :choice => [ 'enable','disable' ],
	:recipes => [ 'yum-repo' ],
  :default => "enable"

attribute 'yum-repo_epel',
  :display_name => "EPEL Yum Repository",
  :description => "Enable EPEL Yum Repository",
  :type => "string",
  :choice => [ 'enable','disable' ],
	:recipes => [ 'yum-repo' ],
  :default => "enable"

attribute 'yum-repo_maql_repository_hostname',
  :display_name => "Repository Hostname",
  :description => "Yum Repository Server's Hostname",
  :type => "string",
	:recipes => [ 'yum-repo' ],
  :default => "54.248.217.187"

attribute 'yum-repo_maql-release_enable',
  :display_name => "Enable maql-release",
  :description => "1 = enable, 0 = disable",
  :choice => [ '0','1' ],
  :type => "string",
	:recipes => [ 'yum-repo' ],
  :default => "1"

attribute 'yum-repo_maql-release-debug_enable',
  :display_name => "Enable maql-release-debug",
  :description => "1 = enable, 0 = disable",
  :type => "string",
  :choice => [ '0','1' ],
	:recipes => [ 'yum-repo' ],
  :default => "0"

attribute 'yum-repo_maql-release-source_enable',
  :display_name => "Enable maql-release-source",
  :description => "1 = enable, 0 = disable",
  :type => "string",
  :choice => [ '0','1' ],
	:recipes => [ 'yum-repo' ],
  :default => "0"

attribute 'yum-repo_maql-testing_enable',
  :display_name => "Enable maql-testing",
  :description => "1 = enable, 0 = disable",
  :type => "string",
  :choice => [ '0','1' ],
	:recipes => [ 'yum-repo' ],
  :default => "0"

attribute 'yum-repo_maql-testing-debug_enable',
  :display_name => "Enable maql-testing-debug",
  :description => "1 = enable, 0 = disable",
  :type => "string",
  :choice => [ '0','1' ],
	:recipes => [ 'yum-repo' ],
  :default => "0"

attribute 'yum-repo_maql-testing-source_enable',
  :display_name => "Enable maql-testing-source",
  :description => "1 = enable, 0 = disable",
  :type => "string",
  :choice => [ '0','1' ],
	:recipes => [ 'yum-repo' ],
  :default => "0"

attribute 'yum-repo_maql-archive_enable',
  :display_name => "Enable maql-archive",
  :description => "1 = enable, 0 = disable",
  :type => "string",
  :choice => [ '0','1' ],
	:recipes => [ 'yum-repo' ],
  :default => "0"

attribute 'yum-repo_maql-archive-debug_enable',
  :display_name => "Enable maql-archive-debug",
  :description => "1 = enable, 0 = disable",
  :type => "string",
  :choice => [ '0','1' ],
	:recipes => [ 'yum-repo' ],
  :default => "0"

attribute 'yum-repo_maql-archive-source_enable',
  :display_name => "Enable maql-archive-source",
  :description => "1 = enable, 0 = disable",
  :type => "string",
  :choice => [ '0','1' ],
	:recipes => [ 'yum-repo' ],
  :default => "0"
