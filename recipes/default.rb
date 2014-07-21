#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ntp::default"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "2.1.1"

node['base']['packages'].each do |pkg|
  package pkg do
    action :install
    not_if "dpkg-query -s #{pkg}"
  end
end
