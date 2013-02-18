date > /etc/vagrant_box_build_time

yum -y install gcc bzip2 make kernel-devel-`uname -r`
yum -y update

rpm -ivh http://yum.puppetlabs.com/el/5/products/x86_64/puppetlabs-release-5-6.noarch.rpm
rpm -ivh http://linux.dell.com/dkms/permalink/dkms-2.2.0.3-1.noarch.rpm

yum -y update
yum -y upgrade

yum -y install gcc-c++ zlib-devel openssl-devel readline-devel sqlite3-devel
yum -y install puppet facter ruby-devel rubygems
yum -y erase wireless-tools gtk2 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all

# Installing chef
#/usr/bin/gem install chef --no-ri --no-rdoc

# Installing vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
if [ -f /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso ];
then
  vboxiso="/home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso"
else
  wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
  vboxiso="/tmp/VBoxGuestAdditions_$VBOX_VERSION.iso"
fi
mount -o loop $vboxiso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -f $vboxiso;

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
sed -i "s/^\(.*env_keep = \"\)/\1PATH /" /etc/sudoers

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

exit
