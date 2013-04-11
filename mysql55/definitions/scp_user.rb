#
# Cookbook Name:: mysql55
# Definition:: scp_user
#

define :scp_user, :action => :create do

	## action :create
	if params[:action] == :create then
		user "scptmpuser" do
			action :create
		end

		%w(scptmpuser_id_rsa scptmpuser_id_rsa.pub).each do |key|
			cookbook_file "/home/scptmpuser/#{key}" do
				user "scptmpuser"
				group "scptmpuser"
				source key
				action :create
			end
		end

		bash "\'scptmpuser\' add_authorized_keys" do
			user "scptmpuser"
			group "scptmpuser"
			cwd "/home/scptmpuser/"
			code <<-EOH
			mkdir -p .ssh
			mv scptmpuser_id_rsa .ssh/id_rsa
			mv scptmpuser_id_rsa.pub .ssh/id_rsa.pub
			cat .ssh/id_rsa.pub > .ssh/authorized_keys
			chmod 700 .ssh
			chmod 600 .ssh/*
			EOH
			action :run
		end
		log "\'scptmpuser\' user is created"
		
	## action ;delete
	elsif params[:action] == :remove then
		user "scptmpuser" do
			action :remove
			supports :manage_home => true
		end
		log "\'scptmpuser\' user is removed"
	end
end
