#
# Cookbook Name:: cron
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

### For remp001 container.
cron "Generate sitemap" do
  user "remper"
  path "/opt/rbenv/shims:/opt/rbenv/bin:/opt/rbenv/plugins/ruby_build/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  command "cd ~/remp/current && bundle exec padrino rake sitemap_generate[10000] -e production"
  hour "4"
  minute "4"
  only_if {node['hostname'] == "remp001"}
end

cron "Ranking tweet" do
  user "remper"
  command "cd ~/remp/current && bundle exec padrino rake report_tweet['ranking'] -e production"
  hour "10,16"
  minute "46"
  only_if {node['hostname'] == "remp001"}
end

cron "Now playing tweet" do
  user "remper"
  command "cd ~/remp/current && bundle exec padrino rake report_tweet['now'] -e production"
  hour "9-18"
  minute "02,32"
  only_if {node['hostname'] == "remp001"}
end

cron "Daily report" do
  user "remper"
  command "cd ~/remp/current && bundle exec padrino rake daily_report -e production"
  hour "08"
  minute "40"
  only_if {node['hostname'] == "remp001"}
end

# Cron restart.
service "cron" do
  action :restart
end

