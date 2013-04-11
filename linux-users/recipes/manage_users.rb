#
# Cookbook Name:: linux-users
# Recipe:: manage_users
#
users = UserInfoCollection.new(node['linux-users']['manage']['users'])
users.list.each do |u|
  exist_group = system("grep \"^#{users.info(u).group}:\" /etc/group > /dev/null")
  exist_user = system("grep \"^#{users.info(u).name}:\" /etc/passwd > /dev/null")

  user_mod users.info(u).name do
    uid        users.info(u).uid
    group      users.info(u).group
    gid        users.info(u).gid
    sgroup     users.info(u).sgroup
    password   users.info(u).password
    ssh_public users.info(u).ssh_public
    if exist_group && exist_user then
      action :modify
    else
      action :add
    end
  end

  ruby_block "\'#{users.info(u).name}\' check_user" do
    block do 
			puts "\n----------------------------------------"
			puts "## id #{users.info(u).name}"
			puts `LANG=C; id #{users.info(u).name}` 
			puts "\n----------------------------------------"
		end
  end

end
