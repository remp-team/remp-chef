#
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

%w{python-software-properties python g++ make}.each do |pkg|
  package pkg do
    action :install
  end
end

