#
# Cookbook Name:: nd-cleaner
# Recipe:: default
#

rightscale_marker

# Install the various required packages for Puppet to function
# properly on most hosts.
node[:'nd-cleaner'][:default][:dpkgs].each do |pkg|
  package pkg
  action :remove
end

# Wipe out any system/application logs
execute "logrotate" do
  command "logrotate -f /etc/logrotate.conf"
  path    [ "/usr/sbin", "/usr/bin", "/sbin", "/bin" ]
  only_if "test -f /etc/logrotate.conf"
  returns [0]
end
execute "remove old logs" do
  command "find /var/log/ -type f -regex '.*\.[0-9].*' -exec rm {} \\;"
  path    [ "/usr/sbin", "/usr/bin", "/sbin", "/bin" ]
  returns [0]
end
execute "remove sudo-io logs" do
  command "rm -rf /var/log/sudo-io/*"
  path    [ "/usr/sbin", "/usr/bin", "/sbin", "/bin" ]
  returns [0]
end 

# Wipe out RightScale logs
file "/var/log/install" do
  backup false
  action :delete
end

# Clean the Puppet certs
include_recipe "nd-puppet::clean" 
