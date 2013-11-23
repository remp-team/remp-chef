#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, REMP Team
#
# All rights reserved - Do Not Redistribute

authorized_keys_for 'remper'

%w{mysql-server}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{mysql}.each do |pkg|
  service pkg do
    action :stop
  end
end

mycnf_path = "/etc/mysql/my.cnf"

template mycnf_path do
  user 'root'
  group 'root'
  mode 644
  source 'my.cnf.erb'
end

%w{mysql}.each do |pkg|
  service pkg do
    action :start
  end
end

