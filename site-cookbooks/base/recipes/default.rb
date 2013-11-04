#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{git rbenv bundler curl libxslt-dev libxml2-dev language-pack-ja-base}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "Set timezone" do
  command "rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime"
end
