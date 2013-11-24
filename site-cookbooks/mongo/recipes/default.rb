#
# Cookbook Name:: mongo
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

%w{mongodb}.each do |pkg|
  package pkg do
    action :install
  end
end

template "/etc/mongodb.conf" do
  user 'root'
  group 'root'
  mode 644
  source 'mongodb.conf.erb'
end

cookbook_file "/home/remper/mongodb_backup" do
  source "mongodb_backup"
  user 'remper'
  group 'remper'
  mode "0744"
end

%w{mongodb}.each do |pkg|
  service pkg do
    action :restart
  end
end

