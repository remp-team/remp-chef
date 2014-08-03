#
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

%w{software-properties-common python-software-properties python g++ make}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "add-apt-repository ppa:chris-lea/node.js" do
  user "root"
end

execute "apt-get update" do
  user "root"
end

%w{nodejs}.each do |pkg|
  package pkg do
    action :install
  end
end

bash "grunt install" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    npm install -g grunt-cli
  EOH
end
