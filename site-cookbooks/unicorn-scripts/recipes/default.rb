# Cookbook Name:: unicorn_scripts
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# unicorn graceful restart script.
template "/usr/local/bin/unicorn_graceful_restart" do
  user 'root'
  group 'root'
  mode 0755
  source 'usr/local/bin/unicorn_graceful_restart'
end

