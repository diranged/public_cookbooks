#
# Cookbook Name:: nd-puppet
# Recipe:: default
#

rightscale_marker

include_recipe "nd-puppet::install" 
include_recipe "nd-puppet::config" 
include_recipe "nd-puppet::run" 
