#
# Cookbook Name:: storyboards-app-base
# Recipe:: default
#
# Copyright 2014, REMP Team
#
# All rights reserved - Do Not Redistribute
#

cron "Screen shot" do
  user "remper"
  command "cd ~/storyboards/current && bundle exec padrino rake screenshot[10] -e production"
  minute "*/8"
end

cron "Daily report" do
  user "remper"
  command "cd ~/storyboards/current && bundle exec padrino rake daily_report -e production"
  hour "8"
  minute "31"
end

cron "Site map generate" do
  user "remper"
  command "cd ~/storyboards/current && bundle exec padrino rake sitemap_generate -e production"
  hour "14"
  minute "35"
end

cron "Casto temporary code erasing." do
  user "remper"
  command "cd ~/storyboards/current && bundle exec padrino rake codecleaner[2,1] -e production"
  hour "5"
  minute "35"
end

