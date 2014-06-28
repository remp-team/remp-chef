#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

include_recipe "rbenv::rbenv_vars"

rbenv_ruby "2.0.0-p481" do
    ruby_version "2.0.0-p481"
      global true
end

%w[bundler pry].each do |gem_name|
  rbenv_gem gem_name do
    ruby_version "2.0.0-p481"
  end
end

