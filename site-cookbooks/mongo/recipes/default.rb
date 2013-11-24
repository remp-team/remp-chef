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

# MongoDB backup settings.
backup_script_name = "/home/remper/mongodb_backup"

cookbook_file backup_script_name do
  source "mongodb_backup"
  user 'remper'
  group 'remper'
  mode "0744"
end

base_min = 51
%w{storyboards_production remp3_production}.each do |db_name|
  cron "Backup #{db_name} DB" do
    user "remper"
    command "/bin/sh #{backup_script_name} #{db_name}"
    hour "19"
    minute "#{base_min}"
  end

  base_min = base_min + 5
end

# MongoDB restart
%w{mongodb}.each do |pkg|
  service pkg do
    action :restart
  end
end

