# VeeWee Definitions

Various new and modified template definitions to create [veewee](https://github.com/jedi4ever/veewee) boxes for [vagrant](https://github.com/mitchellh/vagrant).

## Definitions ##

### General Configuration ###
- Most definitions based off originals from [veewee](https://github.com/jedi4ever/veewee)
- All definitions are 64 bit 
- Australianisation of environment and mirrors
- Change vagrant base config to 2 CPU, 512MB RAM
- Use distribution based Ruby packages where possible
- Use add and install puppet using offical vendor [puppetlabs](http://docs.puppetlabs.com/guides/puppetlabs_package_repositories.html) repositories where possible
- Clean up installations more, move most package installation to postinstall instead of kickstart
- Install VirtualBox Guests Additions based on current VirtualBox version
- Gem based chef install

### Definition List ###

#### definitions/mageia-2 ####
- Uses boot-nonfree iso for network based install
- Distro Ruby packages
- Uses gem for puppet install

#### definitions/centos-5 ####
- Uses full iso DVD 1 of 2 for install
- Puppetlabs supplied Ruby packages
- Puppet install with official Puppetlabs repo

#### definitions/centos-6 ####
- Uses netinstall iso for install
- Puppetlabs supplied Ruby packages
- Puppet install with official Puppetlabs repo

#### definitions/ubuntu-10.04 ####
- Uses Ubuntu Server 10.04.4
- Not using distro Ruby
- Uses gem for puppet install

#### definitions/ubuntu-12.04 ####
- Uses Ubuntu Server 12.04.1
- Distro Ruby packages
- Puppet install with official Puppetlabs repo
