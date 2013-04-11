maintainer       "Xseed Co., Ltd."
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Configures hosts"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

## for cloudrop inputs
## the following attribute are required.
attribute 'hosts_data',
  :display_name => "/etc/hosts",
  :description => "ex. \"1.1.1.1   test1.example.com\",\"1.1.1.2  test2.example.com\"",
  :type => "string",
  :required => "optional"

