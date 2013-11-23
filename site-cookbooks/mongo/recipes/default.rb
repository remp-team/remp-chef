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

%w{mongodb}.each do |pkg|
  service pkg do
    action :restart
  end
end

