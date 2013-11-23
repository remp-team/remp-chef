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
    action :restart
  end
end

