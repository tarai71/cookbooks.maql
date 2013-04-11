#
# Cookbook Name:: hosts
# Recipe:: default
#

## repleace hosts file (input from cloudrop)
ruby_block "replace_hosts" do
  block do
    begin
      hosts_path = "/etc/hosts"
      beg_line = "### BEGIN DYNAMIC BLOCK (cloudrop) - DO NOT EDIT THIS BLOCK!\n"
      end_line = "### END DYNAMIC BLOCK (cloudrop)\n"
      rep_data = node['hosts_data'].split(/[\r\n]+/)

      ## backup
      src_file = open(hosts_path,"r")
#      dst_file = open("#{hosts_path}.#{Time.new.strftime("%y%m%d%H%M%S.bak")}","w")
      dst_file = open("#{hosts_path}.bak","w")
      org_data = src_file.read
      dst_file.write(org_data)
      src_file.close
      dst_file.close
    
      ## replace data
      rep_data.map! {|entry| /.*\n$/ =~ entry ? entry : entry  + "\n"}
      new_data = []
      org_data.each_line do |line|
      new_data << line
    end
  
    beg_idx = new_data.index(beg_line)
    end_idx = new_data.index(end_line)

    if beg_idx != nil && end_idx !=nil then
      new_data[beg_idx + 1 ... end_idx] = nil
      new_data[beg_idx + 1 , 0] = rep_data
      new_data.compact!
    else
      new_data << beg_line
      new_data << rep_data
      new_data << end_line
    end
  
    ## overwrite
    hosts_file = open(hosts_path,"w")
    hosts_file.write(new_data.join)
    hosts_file.close

    ## log
    Chef::Log.info("Success.[replace_hosts]\n#{new_data.join}")

    rescue => err
      Chef::Log.info("error.[replace_hsots]\n#{err}")
    end

  end

  action :create
end

