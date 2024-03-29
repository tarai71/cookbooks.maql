#
# Cookbook Name:: php53
# Attribute:: php_ini
#
default['php_engine'] = "On"
default['php_short_open_tag'] = "Off"
default['php_asp_tags'] = "Off"
default['php_precision'] = "14"
default['php_y2k_compliance'] = "On"
default['php_output_buffering'] = "4096"
default['php_implicit_flush'] = "Off"
default['php_unserialize_callback_func'] = ""
default['php_serialize_precision'] = "17"
default['php_allow_call_time_pass_reference'] = "Off"
default['php_safe_mode'] = "Off"
default['php_safe_mode_gid'] = "Off"
default['php_safe_mode_include_dir'] = ""
default['php_safe_mode_exec_dir'] = ""
default['php_safe_mode_allowed_env_vars'] = "PHP"
default['php_safe_mode_protected_env_vars'] = "LD_LIBRATY_PATH"
default['php_disable_functions'] = ""
default['php_disable_classes'] = ""
default['php_zend.enable_gc'] = "On"
default['php_expose_php'] = "On"
default['php_max_execution_time'] = "30"
default['php_max_input_time'] = "60"
default['php_memory_limit'] = "512M"
default['php_error_reporting'] = " E_ALL & ~E_NOTICE | E_DEPRECATED"
default['php_display_errors'] = "Off"
default['php_display_startup_errors'] = "Off"
default['php_log_errors'] = "On"
default['php_log_errors_max_len'] = "1024"
default['php_ignore_repeated_errors'] = "Off"
default['php_ignore_repeated_source'] = "Off"
default['php_report_memleaks'] = "On"
default['php_track_errors'] = "On"
default['php_html_errors'] = "Off"
default['php_variables_order'] = "\"GPCS\""
default['php_request_order'] = "\"GP\""
default['php_register_globals'] = "Off"
default['php_register_long_arrays'] = "Off"
default['php_register_argc_argv'] = "Off"
default['php_auto_globals_jit'] = "On"
default['php_post_max_size'] = "8M"
default['php_magic_quotes_gpc'] = "Off"
default['php_magic_quotes_runtime'] = "Off"
default['php_magic_quotes_sybase'] = "Off"
default['php_auto_prepend_file'] = ""
default['php_auto_append_file'] = ""
default['php_default_mimetype'] = "\"text/html\""
default['php_doc_root'] = ""
default['php_user_dir'] = ""
default['php_enable_dl'] = "Off"
default['php_file_uploads'] = "On"
default['php_upload_max_filesize'] = "2M"
default['php_max_file_uploads'] = "20"
default['php_allow_url_fopen'] = "On"
default['php_allow_url_include'] = "Off"
default['php_default_socket_timeout'] = "60"
default['php_date.timezone'] = "Asia/Tokyo"
default['php_pdo_mysql.cache_size'] = "2000"
default['php_pdo_mysql.default_socket'] = ""
default['php_define_syslog_variables'] = "Off"
default['php_SMTP'] = "localhost"
default['php_smtp_port'] = "25"
default['php_mail.add_x_header'] = "On"
default['php_sql.safe_mode'] = "Off"
default['php_odbc.allow_persistent'] = "On"
default['php_odbc.check_persistent'] = "On"
default['php_odbc.max_persistent'] = "-1"
default['php_odbc.max_links'] = "-1"
default['php_odbc.defaultlrl'] = "4096"
default['php_odbc.defaultbinmode'] = "1"
default['php_ibase.allow_persistent'] = "1"
default['php_ibase.max_persistent'] = "-1"
default['php_ibase.max_links'] = "-1"
default['php_ibase.timestampformat '] = "%Y-%m-%d %H:%M:%S"
default['php_ibase.dateformat'] = "%Y-%m-%d"
default['php_ibase.timeformat'] = "%H:%M:%S"
default['php_mysql.allow_local_infile'] = "On"
default['php_mysql.allow_persistent'] = "On"
default['php_mysql.cache_size'] = "2000"
default['php_mysql.max_persistent'] = "-1"
default['php_mysql.max_links'] = "-1"
default['php_mysql.default_port'] = ""
default['php_mysql.default_socket'] = ""
default['php_mysql.default_host'] = ""
default['php_mysql.default_user'] = ""
default['php_mysql.default_password'] = ""
default['php_mysql.connect_timeout'] = "60"
default['php_mysql.trace_mode'] = "Off"
default['php_mysqli.max_persistent'] = "-1"
default['php_mysqli.allow_persistent'] = "On"
default['php_mysqli.max_links'] = "-1"
default['php_mysqli.cache_size'] = "2000"
default['php_mysqli.default_port'] = "3306"
default['php_mysqli.default_socket'] = ""
default['php_mysqli.default_host'] = ""
default['php_mysqli.default_user'] = ""
default['php_mysqli.default_pw'] = ""
default['php_mysqli.reconnect'] = "Off"
default['php_mysqlnd.collect_statistics'] = "On"
default['php_mysqlnd.collect_memory_statistics'] = "On"
default['php_pgsql.allow_persistent'] = "On"
default['php_pgsql.auto_reset_persistent'] = "Off"
default['php_pgsql.max_persistent'] = "-1"
default['php_pgsql.max_links'] = "-1"
default['php_pgsql.ignore_notice'] = "0"
default['php_pgsql.log_notice'] = "0"
default['php_sybct.allow_persistent'] = "On"
default['php_sybct.max_persistent'] = "-1"
default['php_sybct.max_links'] = "-1"
default['php_sybct.min_server_severity'] = "10"
default['php_sybct.min_client_severity'] = "10"
default['php_bcmath.scale'] = "0"
default['php_session.save_handler'] = "files"
default['php_session.use_cookies'] = "1"
default['php_session.use_only_cookies'] = "1"
default['php_session.name'] = "PHPSESSID"
default['php_session.auto_start'] = "0"
default['php_session.cookie_lifetime'] = "0"
default['php_session.cookie_path'] = "/"
default['php_session.cookie_domain'] = ""
default['php_session.cookie_httponly'] = ""
default['php_session.serialize_handler'] = "php"
default['php_session.gc_probability'] = "1"
default['php_session.gc_divisor'] = "1000"
default['php_session.gc_maxlifetime'] = "1440"
default['php_session.bug_compat_42'] = "On"
default['php_session.bug_compat_warn'] = "On"
default['php_session.referer_check'] = ""
default['php_session.entropy_length'] = "0"
default['php_session.cache_limiter'] = "nocache"
default['php_session.cache_expire'] = "180"
default['php_session.use_trans_sid'] = "0"
default['php_session.hash_function'] = "0"
default['php_session.hash_bits_per_character'] = "5"
default['php_url_rewriter.tags'] = "\"a=href,area=href,frame=src,input=src,form=fakeentry\""
default['php_mssql.allow_persistent'] = "On"
default['php_mssql.max_persistent'] = "-1"
default['php_mssql.max_links'] = "-1"
default['php_mssql.min_error_severity'] = "10"
default['php_mssql.min_message_severity'] = "10"
default['php_mssql.compatability_mode'] = "Off"
default['php_mssql.secure_connection'] = "Off"
default['php_tidy.clean_output'] = "Off"
default['php_soap.wsdl_cache_enabled'] = "1"
default['php_soap.wsdl_cache_dir'] = "\"/tmp\""
default['php_soap.wsdl_cache_ttl'] = "86400"
default['php_soap.wsdl_cache_limit'] = "5"
default['php_ldap.max_links'] = "-1"
