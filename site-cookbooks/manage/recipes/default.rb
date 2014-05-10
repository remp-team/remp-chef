#
# Cookbook Name:: manage
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# npm_lazy settings.
bash "npm_lazy" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    npm install -g npm_lazy
  EOH
end

directory '/home/remper/.npm_lazy' do
    owner   'remper'
    group   'remper'
    mode    '0755'
    action  :create
end

template "/home/remper/.npm_lazy/npm_lazy.config.js" do
  source "npm_lazy/npm_lazy.config.js.erb"
  mode 0644
  owner "remper"
  group "remper"
end

# hubot settings.
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

template "/etc/supervisor/conf.d/npm_lazy.conf" do
  source "supervisor/npm_lazy.conf.erb"
  mode 0644
  owner "remper"
  group "remper"
end

service "supervisor" do
  supports :restart => true, :reload => true
  action :enable
end

