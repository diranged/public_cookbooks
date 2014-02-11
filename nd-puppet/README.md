# nd-puppet: Puppet Bootstrapping Cookbook

This cookbook is available at [https://github.com/nextdoor/public_cookbooks](https://github.com/nextdoor/public_cookbooks).

This cookbook installs and configures Puppet on a server, then runs it
a configured number of times looking for a safe (0) exit code.

# Requirements

Requires a virtual machine from a RightScale managed RightImage.
Puppet is installed and configured under the root user for a host.

 * Cookbook: [rightscale](https://github.com/rightscale/rightscale_cookbooks/tree/master/cookbooks/rightscale)

# Usage

Usage of this recipe requires that you have a Puppet Policy-based autosigning
script in place on your Puppet master that can validate the CSR information
supplied.

[Puppet 3.4 Policy-based Auto Signing](http://docs.puppetlabs.com/puppet/3/reference/release_notes.html#policy-based-certificate-autosigning)

# Attributes

These are settings used in recipes and tempaltes. Default values are noted.

Note: Only "internal" cookbook attributes are described here. Descriptions of
attributes which have inputs can be found in the metadata.rb file.

## Puppet installation attributes

* `node[:'nd-puppet'][:default][:version]` - The Puppet version to install.

## Puppet configuration attributes

* `node[:'nd-puppet'][:config][:facts]` - Array of custom key=value puppet facts.
* `node[:'nd-puppet'][:config][:puppet_node]` - The Puppet node name.
  (default: $hostname)
* `node[:'nd-puppet'][:config][:node_name]` - Puppet Option: node\_name.
  (default: node\_name)
* `node[:'nd-puppet'][:config][:node_name_fact]` - Puppet Option: node\_name\_fact.
  (default: puppet\_node)
* `node[:'nd-puppet'][:config][:challenge_password]` - Optional string passed to the
  puppet master as a CSR Attribute named challengePassword.

# Recipes

## `nd-puppet::default`

Installs, configures and executes Puppet. Meta-recipe that includes:

* `nd-puppet::install`
* `nd-puppet::config`
* `nd-puppet::run`

## `nd-puppet::install`

Ensures that the requested Puppet version is installed.

## `nd-puppet::config`

Configures the custom puppet facts and configures puppet for its first run.

## `nd-puppet::clean`

Wipes out the existing configured Puppet state created by the nd-puppet:config
class. This is useful for prepping a machine for imaging.

# Author

Author:: Nextdoor Inc. (<cookbooks@nextdoor.com>)

# License

Copyright 2014 Nextdoor.com, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
