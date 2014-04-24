#
# Cookbook Name:: manage
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{supervisor redis-server}.each do |pkg|
  package pkg do
    action :install
  end
end

template "/etc/supervisor/supervisord.conf" do
  source "supervisor/supervisord.conf.erb"
  mode 0644
  owner "root"
  group "root"
end

template "/etc/supervisor/conf.d/hubot.conf" do
  source "supervisor/hubot.conf.erb"
  mode 0644
  owner "remper"
  group "remper"
end


