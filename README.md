# VeeWee Definitions

Various new and modified template definitions to create [veewee](https://github.com/jedi4ever/veewee) boxes for [vagrant](https://github.com/mitchellh/vagrant).

## Definitions ##

### General Changes ###
- Most definitions based off originals from [veewee](https://github.com/jedi4ever/veewee)
- All definitions are 64 bit 
- Australianisation of environment and mirrors
- Change vagrant base config to 2 CPU, 512MB RAM
- Use distribution based Ruby packages where possible
- Use add and install puppet using offical vendor [puppetlabs](http://docs.puppetlabs.com/guides/puppetlabs_package_repositories.html) repositories where possible
- Clean up installations more, move most package installation to postinstall instead of kickstart
- Install VirtualBox Guests Additions based on current VirtualBox version

### Definition List ###

#### definitions/centos-5.8 ####
- Uses full iso DVD 1 of 2 for install
- Distro Ruby packages
- Puppet install with official Puppetlabs repo

#### definitions/centos-6.2 ####
- Uses netinstall iso for install
- Distro Ruby packages
- Puppet install with official Puppetlabs repo

#### definitions/centos-6.3 ####
- Uses netinstall iso for install
- Distro Ruby packages
- Puppet install with official Puppetlabs repo

#### definitions/ubuntu-10.04 ####
- Uses Ubuntu Server 10.04.4
- Not using distro Ruby
- Uses gem for puppet install

#### definitions/ubuntu-10.10 ####
- Not using distro Ruby 
- Uses gem for puppet install

#### definitions/ubuntu-11.04 ####
- Not using distro Ruby
- Uses gem for puppet install

#### definitions/ubuntu-11.10 ####
- Not using distro Ruby
- Uses gem for puppet install

#### definitions/ubuntu-12.04 ####
- Distro Ruby packages
- Puppet install with official Puppetlabs repo

##### Known Issues #####
- (Base Box Creation Only) Sometimes will not shutdown correctly for restart before postinstall due to e1000 issue. Works fine after manual reboot.
