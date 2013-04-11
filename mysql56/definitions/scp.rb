#
# Cookbook Name:: mysql55
# Definition:: scp
#
define :scp, :dest_host => nil, :action => :run do

  ## action :run
  if params[:action] == :run then
    bash "scp dump-data to #{params[:dest_host]}" do
      user "scptmpuser"
      group "scptmpuser"
      cwd "/home/scptmpuser/"
      code <<-EOH
      ssh-keyscan -t rsa #{params[:dest_host]} >> .ssh/known_hosts
      chmod 600 .ssh/known_hosts
      ssh scptmpuser@#{params[:dest_host]} hostname
      if [ $? -eq 0 ]; then
        scp #{params[:name]} scptmpuser@#{params[:dest_host]}:/tmp/
      fi
      EOH
#     not_if "grep \"#{:dest_host}\" .ssh/known_hosts"
      only_if "id scptmpuser"
    end
#    log "scp #{params[:name]} to #{params[:dest_host]}:/tmp/"

  else
    log "action is not defined"
  end
end
