#
# Cookbook Name:: manage
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


%w{hubot coffee-script}.each do |p|
  execute p do
    command "npm install -g #{p}"
  end
end

%w{redis-server}.each do |pkg|
  package pkg do
    action :install
  end
end


