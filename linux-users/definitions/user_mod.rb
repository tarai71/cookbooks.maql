#
# Cookbook Name:: linux-users
# difinitions:: user_mod
#

define :user_mod, :user_name => nil, :uid => nil, :group => nil, :gid => nil, :sgroup => [], :password => nil, :ssh_public => nil, :aciton => :add do
  ## params
  params[:user_name] = params[:name] if params[:user_name].nil?
  params[:group] = params[:user_name] if params[:group].nil?
	params[:sgroup] = [] if params[:sgroup].nil?

  if params[:action] == :add or params[:action] == :modify then
    ## add or modify group
    group params[:group] do
      gid params[:gid] unless params[:gid].nil?
      if params[:action] == :add then
        action :create
      else
        action :modify
      end
    end

    ## add or modify user
    user params[:user_name] do
      uid  params[:uid] unless params[:uid].nil?
			unless params[:gid].nil? then
        gid  params[:gid]
			else
				gid  params[:name]
			end
      if params[:action] == :add then
        action :create
      else
        action :modify
      end
    end

    ## modify supplementary groups
    script "\'#{params[:name]}\' add_supplementary_groups (#{params[:sgroup].join(",")})" do
      interpreter "bash"
      user "root"
      code <<-EOH
      usermod -G "#{params[:sgroup].join(",")}" #{params[:user_name]}
      EOH
      action :run
    end

    ## add authorized_keys
    unless params[:ssh_public].nil? then
      script "\'#{params[:name]}\' add_authorized_keys" do
        interpreter "bash"
        user params[:user_name]
        group params[:group]
        cwd "/home/#{params[:user_name]}/"
        code <<-EOH
        mkdir -p .ssh
        echo #{params[:ssh_public]} >> .ssh/authorized_keys
        chmod 700 .ssh
        chmod 600 .ssh/authorized_keys
        EOH
        not_if "grep #{params[:ssh_public][9,100]} /home/#{params[:user_name]}/.ssh/authorized_keys"
        action :run
      end
    end

    ## add or modify password
    unless params[:password].nil? then
      execute "\'#{params[:name]}\' change_password" do
        command "echo #{params[:user_name]}:#{params[:password]} | chpasswd"
        action :run
      end
    end

  elsif params[:action] == :delete then
    ## delete user & group
    user params[:user_name] do
      action :remove
      supports :manage_home => true
    end
  end
end
