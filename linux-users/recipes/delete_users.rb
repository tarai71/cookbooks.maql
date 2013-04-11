#
# Cookbook Name:: linux-users
# Recipe:: delete_users
#
users = UserInfoCollection.new(node['linux-users']['delete']['users'])
users.list.each do |u|
  user_mod users.info(u).name do
    action :delete
  end
end

