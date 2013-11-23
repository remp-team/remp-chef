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

mycnf_path = '/etc/mysql/my.cnf'

template mycnf_path do
  user 'root'
  group 'root'
  mode 644
  source 'default/my.cnf.erb'
end

%w{mysql}.each do |pkg|
  service pkg do
    action :restart
  end
end

