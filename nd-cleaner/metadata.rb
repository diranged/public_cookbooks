name             'nd-cleaner'
maintainer       'Nextdoor, Inc.'
maintainer_email 'cookbooks@nextdoor.com'
license          'Apache 2.0'
description      'Cleans a system for imaging'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'

depends "rightscale"
depends "nd-puppet"

supports "ubuntu"

recipe "nd-cleaner::default",
  "Prepares a system for imaging by cleaning it."

# Installation Attributes
attribute "nd-cleaner/default/dpkgs",
  :display_name => "Debian packages to remove",
  :description  =>
    "A list of Debian packages that should be removed for system" +
    "cleaning (generally packages that install files to non-root " +
    "storage locations).",
  :required     => "optional",
  :category     => "Nextdoor: Cleaner",
  :recipes      => [ "nd-cleaner::default" ]
