## User Data
## Array:
#[{"user_name"=>"h-goto","uid"=>1000,"group"=>"h-goto","gid"=>1000,"sgroup"=>["wheel"],"password"=>"password","ssh-public"=>"..."},{...},{...},...]

## Yaml:
#---
#- user_name: h-goto
#  uid: 1000
#  group: h-goto
#  gid: 1000
#  sgroup: 
#  - wheel
#  password: password
#  ssh_public: ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA2j3QPkQJj6Ja98ZDRoDId9O+Dv+0G+/F0NiUyaFT0wy7JuS7VxNS011ZLiJpWJlddO4UbEyCBrV6MApZiTvqzGgooG3gHoARmII8id6SD3Z5Gxo+NVbaK0XM/0oJsFAsCdNTdGPV3K7U8Z5rTNZtqPwieHOIZ2vxNYkQIGkIvStOwVaRGTrf7keangIRXxKfl8aOMRgm9T0ORl7JOtxElGKYC2lznnMYNFZ0FWjgLWhxdSGhzHQ9dVnULa6CT/A+KoZQMpu9lNTIYIgF7KbPqw4M244FSEYI3A8kexGLGKB7UiRbCQUil6GQEJAPFkarkDn2ObAHfD57pWZYi/c0mw== h-goto@chef

class UserInfoCollection 

  class UserInfo
    def initialize(info={})
      ## "info" is Hash Object.
      i = info.to_hash
      raise ArgumentError, "invalid argument" unless i.instance_of?(Hash)
      @name = i.fetch("username",nil)
      @uid = i.fetch("uid",nil)
      @group = i.fetch("group",nil)
      @gid = i.fetch("gid",nil)
      @sgroup = i.fetch("sgroup",[])
      @password = i.fetch("password",nil)
      @ssh_public = i.fetch("ssh_public",nil)
    end
    attr_reader :name, :uid, :group, :gid, :sgroup, :password, :ssh_public

    def empty?
      @name.nil?
    end

  end

  def initialize(collection)
    ## "usersinfo" is Array Object.
    collection = [] unless collection
    raise ArgumentError, "invalid argument" unless collection.instance_of?(Array)
    @collection = []
    collection.each { |i|
      info = UserInfo.new(i)
      @collection << info
    }
  end

  def list
    username = []
    @collection.each {|u| username << u.name }
    return username.compact
  end

  def info(name)
    usersinfo = UserInfo.new()
    @collection.each { |i|
      if i.name == name then
        usersinfo = i
        break
      end
    }
    usersinfo.empty? ? nil : usersinfo
  end

  def info_all
    userinfo = []
    usersinfo = @collection 
    usersinfo.empty? ? nil : usersinfo
  end

end

## debug
#a = UserInfoCollection.new([{"user_name"=>"h-goto"},{"user_name"=>"s-kusano"}])
#puts a.list
#puts a.info_all
#puts a.info("a")
#puts a.info("h-goto")
