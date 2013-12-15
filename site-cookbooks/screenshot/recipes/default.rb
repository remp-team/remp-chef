#
# Cookbook Name:: screenshot
# Recipe:: default
#
# Copyright 2013, REMP Team
#
# All rights reserved - Do Not Redistribute
#

%w{libxrender1 libfontconfig1 otf-ipafont-gothic libxext6}.each do |pkg|
  package pkg do
    action :install
  end
end

bash "wkhtmltoimage install." do
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget 'https://wkhtmltopdf.googlecode.com/files/wkhtmltoimage-0.10.0_rc2-static-amd64.tar.bz2';
    tar xjfv wkhtmltoimage-0.10.0_rc2-static-amd64.tar.bz2
    mv wkhtmltoimage-amd64 /usr/local/bin
  EOH
end
