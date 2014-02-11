# nd-cleaner: Prepares a Puppetized-host for AMI Baking 

Source: [https://github.com/nextdoor/public_cookbooks](https://github.com/nextdoor/public_cookbooks).

This cookbook cleans a system in preparation for imaging. The goal is
to wipe out anything that should not be imaged. Generally speaking this
includes files/packages that you have installed to any non-root storage.

# Requirements

 * Cookbook: [nd-puppet](https://github.com/nextdoor/public_cookbooks)
 * Cookbook: [rightscale](https://github.com/rightscale/rightscale_cookbooks/tree/master/cookbooks/rightscale)

# Usage

Supply a list of packages that should be removed with the attributes described
below.

# Attributes

These are settings used in recipes and templates. Default values are noted.

Note: Only "internal" cookbook attributes are described here. Descriptions of
attributes which have inputs can be found in the metadata.rb file.

* `node[:'nd-cleaner'][:default][:dpkgs]` - Debian Packages to Remove

# Recipes

## `nd-puppet::default`

Removes any packages supplied to the attributes aboved, then executes the
following Chef recipes:

* `nd-puppet::clean`

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
