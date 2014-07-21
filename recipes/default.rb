#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ntp::default"
include_recipe "rvm::system"

node['base']['packages'].each do |pkg|
  package pkg do
    action :install
    not_if "dpkg-query -s #{pkg}"
  end
end
