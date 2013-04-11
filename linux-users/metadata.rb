maintainer       "Xseed"
maintainer_email "h-goto@xseed.co.jp"
license          "All rights reserved"
description      "Add/Remove Linux accounts"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
recipe           "linux-users::manage_users", "Manage Linux accounts & SSH Keys"
recipe           "linux-users::delete_users", "Delete Linux accounts & SSH Keys"
supports         ["redhat"]

## for cloudrop inputs
## the following attribute are required.
attribute 'linux-users_manage_users',
  :display_name => "Manage Linux Users",
  :description => "Yaml ex. - username: h-goto\n  uid: 1002\n  gid:1002\n  password: password\n  sgroup: \n  - wheel\n  ssh_public: ...\n - username: ...",
  :type => "string",
	:recipes => [ 'manage_users' ]

attribute 'linux-users_delete_users',
  :display_name => "Delete Linux Users",
  :description => "Yaml ex. - username: h-goto\n- username: ...",
  :type => "string",
	:recipes => [ 'delete_users' ]
