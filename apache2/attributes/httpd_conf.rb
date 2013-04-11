#
# Cookbook Name:: apache2
# Attribute:: httpd_conf.rb
#
default['apache2_ServerTokens'] = "Prod"
default['apache2_ServerRoot'] = "\"/etc/httpd\""
default['apache2_PidFile'] = "run/httpd/httpd.pid"
default['apache2_Timeout'] = "60"
default['apache2_KeepAlive'] = "Off"
default['apache2_MaxKeepAliveRequests'] = "100"
default['apache2_KeepAliveTimeout'] = "15"
default['apache2_prefork_c_StartServers'] = "8"
default['apache2_prefork_c_MinSpareServers'] = "5"
default['apache2_prefork_c_MaxSpareServers'] = "20"
default['apache2_prefork_c_ServerLimit'] = "256"
default['apache2_prefork_c_MaxClients'] = "256"
default['apache2_prefork_c_MaxRequestsPerChild'] = "4000"
default['apache2_worker_c_StartServers'] = "4"
default['apache2_worker_c_MaxClients'] = "300"
default['apache2_worker_c_MinSpareThreads'] = "25"
default['apache2_worker_c_MaxSpareThreads'] = "75 "
default['apache2_worker_c_ThreadsPerChild'] = "25"
default['apache2_worker_c_MaxRequestsPerChild'] = "0"
default['apache2_Listen'] = 80
default['apache2_Include'] = "conf.d/*.conf"
default['apache2_User'] = "apache"
default['apache2_Group'] = "apache"
default['apache2_ServerAdmin'] = "root@localhost"
default['apache2_ServerName'] = "127.0.0.1:80"
default['apache2_UseCanonicalName'] = "Off"
default['apache2_DocumentRoot'] = "/var/www/html"
default['apache2_Directory_root_Options'] = "-Indexes FollowSymLinks"
default['apache2_Directory_root_AllowOverride'] = "None"
default['apache2_Directory_html_Options'] = "-Indexes FollowSymLinks"
default['apache2_Directory_html_AllowOverride'] = "All"
default['apache2_Directory_html_Order'] = "allow,deny"
default['apache2_Directory_html_Allow_from'] = "all"
default['apache2_IfModule_mod_userdir.c_UserDir'] = "disabled"
default['apache2_DirectoryIndex'] = "index.html"
default['apache2_AccessFileName'] = ".htaccess"
default['apache2_Files_ht_Order'] = "allow,deny"
default['apache2_Files_ht_Deny_from'] = "all"
default['apache2_Files_ht_Satisfy'] = "All"
default['apache2_TypesConfig'] = "conf/mime.types"
default['apache2_DefaultType'] = "text/plain"
default['apache2_IfModule_mod_mime_magic_c_MIMEMagicFile'] = "conf/magic"
default['apache2_HostnameLookups'] = "Off"
default['apache2_ErrorLog'] = "logs/error_log"
default['apache2_LogLevel'] = "warn"
default['apache2_LogFormat_combined'] = "\"%h %l %u %t \\\"%r\\\" %>s %b \\\"%{Referer}i\\\" \\\"%{User-Agent}i\\\"\""
default['apache2_LogFormat_common'] = "\"%h %l %u %t \\\"%r\\\" %>s %b\""
default['apache2_LogFormat_referer'] = "\"%{Referer}i -> %U\""
default['apache2_LogFormat_agent'] = "\"%{User-agent}i\""
default['apache2_CustomLog_combined'] = "logs/access_log"
default['apache2_ServerSignature'] = "Off"
default['apache2_Alias_icons'] = "/icons/"
default['apache2_icons_dir'] = "/var/www/icons"
default['apache2_Directory_icons_Options'] = "Indexes MultiViews FollowSymLinks"
default['apache2_Directory_icons_AllowOverride'] = "None"
default['apache2_Directory_icons_Order'] = "allow,deny"
default['apache2_Directory_icons_Allow_from'] = "all"
default['apache2_IfModule_mod_dav_fs_c_DAVLockDB'] = "/var/lib/dav/lockdb"
default['apache2_ScriptAlias'] = "/cgi-bin/ \"/var/www/cgi-bin/\""
default['apache2_Directory_cgi-bin_AllowOverride'] = "None"
default['apache2_Directory_cgi-bin_Options'] = "None"
default['apache2_Directory_cgi-bin_Order'] = "allow,deny"
default['apache2_Directory_cgi-bin_Allow_from'] = "all"
default['apache2_IndexOptions'] = "FancyIndexing VersionSort NameWidth=* HTMLTable Charset=UTF-8"
default['apache2_AddIconByEncoding'] = "(CMP,/icons/compressed.gif) x-compress x-gzip"
default['apache2_AddIconByType'] = %w{
(TXT,/icons/text.gif)\ text/*
(IMG,/icons/image2.gif)\ image/*
(SND,/icons/sound2.gif)\ audio/*
(VID,/icons/movie.gif)\ video/*
}
default['apache2_AddIcon'] = %w{
/icons/binary.gif\ .bin\ .exe
/icons/binhex.gif\ .hqx
/icons/tar.gif\ .tar
/icons/world2.gif\ .wrl\ .wrl.gz\ .vrml\ .vrm\ .iv
/icons/compressed.gif\ .Z\ .z\ .tgz\ .gz\ .zip
/icons/a.gif\ .ps\ .ai\ .eps
/icons/layout.gif\ .html\ .shtml\ .htm\ .pdf
/icons/text.gif\ .txt
/icons/c.gif\ .c
/icons/p.gif\ .pl\ .py
/icons/f.gif\ .for
/icons/dvi.gif\ .dvi
/icons/uuencoded.gif\ .uu
/icons/script.gif\ .conf\ .sh\ .shar\ .csh\ .ksh\ .tcl
/icons/tex.gif\ .tex
/icons/bomb.gif\ core
/icons/back.gif\ ..
/icons/hand.right.gif\ README
/icons/folder.gif\ ^^DIRECTORY^^
/icons/blank.gif\ ^^BLANKICON^^
}

default['apache2_DefaultIcon'] = "/icons/unknown.gif"
default['apache2_ReadmeName'] = "README.html"
default['apache2_HeaderName'] = "HEADER.html"
default['apache2_IndexIgnore'] = ".??* *~ *# HEADER* README* RCS CVS *,v *,t"
default['apache2_AddLanguage'] = %w{
ca\ .ca
cs\ .cz\ .cs
da\ .dk
de\ .de
el\ .el
en\ .en
eo\ .eo
es\ .es
et\ .et
fr\ .fr
he\ .he
hr\ .hr
it\ .it
ja\ .ja
ko\ .ko
ltz\ .ltz
nl\ .nl
nn\ .nn
no\ .no
pl\ .po
pt\ .pt
pt-BR\ .pt-br
ru\ .ru
sv\ .sv
zh-CN\ .zh-cn
zh-TW\ .zh-tw
}
default['apache2_LanguagePriority'] = %w{
en
ca
cs
da
de
el
eo
es
et
fr
he
hr
it
ja
ko
ltz
nl
nn
no
pl
pt
pt-BR
ru
sv
zh-CN
zh-TW
}
default['apache2_ForceLanguagePriority'] = "Prefer Fallback"
default['apache2_AddDefaultCharset'] = "UTF-8"
## Default AddType
default['apache2_AddType'] = %w{
application/x-compress\ .Z
application/x-gzip\ .gz\ .tgz
application/x-x509-ca-cert\ .crt
application/x-pkcs7-crl\ \ \ \ .crl
text/html\ .shtml
}
## Other AddType
#application/x-tar .tgz
#}
default['apache2_AddHandler'] = "type-map var"
default['apache2_AddOutputFilter'] = "INCLUDES .shtml"
default['apache2_Alias_error'] = "/error/ \"/var/www/error/\""
default['apache2_Directory_error_AllowOverride'] = "None"
default['apache2_Directory_error_Options'] = "IncludesNoExec"
default['apache2_Directory_error_AddOutputFilter'] = "Includes html"
default['apache2_Directory_error_AddHandler'] = "type-map var"
default['apache2_Directory_error_Order'] = "allow,deny"
default['apache2_Directory_error_Allow_from'] = "all"
default['apache2_Directory_error_LanguagePriority'] = "en es de fr"
default['apache2_Directory_error_ForceLanguagePriority'] = "Prefer Fallback"
default['apache2_BrowserMatch'] = %w{
"Mozilla/2"\ nokeepalive
"MSIE\ 4\\.0b2;"\ nokeepalive\ downgrade-1.0\ force-response-1.0
"RealPlayer\ 4\\.0"\ force-response-1.0
"Java/1\\.0"\ force-response-1.0
"JDK/1\\.0"\ force-response-1.0
"Microsoft\ Data\ Access\ Internet\ Publishing\ Provider"\ redirect-carefully
"MS\ FrontPage"\ redirect-carefully
"^WebDrive"\ redirect-carefully
"^WebDAVFS/1.[0123]"\ redirect-carefully
"^gnome-vfs/1.0"\ redirect-carefully
"^XML\ Spy"\ redirect-carefully
"^Dreamweaver-WebDAV-SCM1"\ redirect-carefully
}

