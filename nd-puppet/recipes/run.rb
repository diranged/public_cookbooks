#
# Cookbook Name:: nd-puppet
# Recipe:: run
#

rightscale_marker

# At recipe run time, gather the actual live hostname of the server and
# use it as the server 'certname' when puppet executes. This guarantees
# that if we've brought up a *loned* server, that any existing *certname*
# value in the puppet.conf is ignored.
#real_fqdn = Mixlib::ShellOut.new('/bin/hostname -f').run_command.stdout.strip

# Repeatedly execute the 'puppet agent -t' command until the command
# exits with a '0' exit code, or fails entirely.
execute "run puppet-agent" do
  command     "puppet agent -t --pluginsync " +
              " --allow_duplicate_certs" +
              " --config_file_name NON_EXISTANT_FILE" +
              " --environment #{node[:'nd-puppet'][:run][:environment]} " +
              " --ca_server #{node[:'nd-puppet'][:run][:ca_server]} " +
              " --server #{node[:'nd-puppet'][:run][:server]} " +
              " --node_name #{node[:'nd-puppet'][:config][:node_name]} " + 
              " --node_name_fact #{node[:'nd-puppet'][:config][:node_name_fact]}" +
              " --waitforcert #{node[:'nd-puppet'][:config][:waitforcert]}"
  path        [ "/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin",
                "/sbin", "/bin" ]
  not_if      "grep \'changed: 0\' /var/lib/puppet/state/last_run_summary.yaml"
  retries     node[:'nd-puppet'][:run][:retries]
  retry_delay node[:'nd-puppet'][:run][:retry_delay]
  returns     [0]
end

# At this point, Puppet has run successfully, so we remove the tag indicating
# this host needs its cert signed.
right_link_tag "nd:puppet_state=signed"
right_link_tag "nd:puppet_secret=#{node[:'nd-puppet'][:config][:pp_preshared_key]}" do
  action :remove
end
