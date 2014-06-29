#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, REMP team
#
# All rights reserved - Do Not Redistribute
#

authorized_keys_for 'remper'

execute "apt-get update" do
  user "root"
end

%w{git curl libxslt-dev libxml2-dev language-pack-ja-base}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "Set timezone" do
  command "rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime"
end


