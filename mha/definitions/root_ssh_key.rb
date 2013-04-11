#
# Cookbook Name:: mha
# Definition:: root_ssh_key
#

define :root_ssh_key, :action => :create do

	## action :create
	if params[:action] == :create then

		%w(mha_id_rsa mha_id_rsa.pub).each do |key|
			cookbook_file "/root/#{key}" do
				user "root"
				group "root"
				source key
				action :create
			  not_if "test -f /root/.ssh/mha_id_rsa.pub"
			end
		end

		bash "\'root\' add_authorized_keys" do
			user "root"
			group "root"
			cwd "/root/"
			code <<-EOH
			mkdir -p .ssh
			mv mha_id_rsa .ssh/id_rsa
			mv mha_id_rsa.pub .ssh/mha_id_rsa.pub
			cat .ssh/mha_id_rsa.pub >> .ssh/authorized_keys
			chmod 700 .ssh
			chmod 600 .ssh/*
			EOH
			action :run
			not_if "grep \"$(cat /root/.ssh/mha_id_rsa.pub)\" /root/.ssh/authorized_keys"
		end

	end
end
