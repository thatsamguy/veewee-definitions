date > /etc/vagrant_box_build_time

# Disable kernel upgrades as they will break manually built vbox guest additions
echo "/^kernel-desktop/" >> /etc/urpmi/skip.list
echo "/^kernel-server/" >> /etc/urpmi/skip.list

# Clear repo mirros
urpmi.removemedia -qa

# Manually add specific mirror
urpmi.addmedia -q --distrib http://mirror.internode.on.net/pub/mageia/distrib/2/x86_64

# Adds default distributed mirrors
urpmi.addmedia -q --distrib --mirrorlist '$MIRRORLIST'

# Update the mirrors
urpmi.update -qa

# Update already installed packages
urpmi -q --auto --auto-select

# Install puppet and chef dependencies
urpmi -q --auto kernel-server-devel-`uname -r|sed 's/server-//g'`
urpmi -q --auto gcc-c++ lib64zlib-devel lib64openssl-devel lib64readline-devel lib64sqlite3-devel
urpmi -q --auto ruby-devel rubygems wget

# Cleanup our mess for space saving
urpmi -q --clean

# Installing puppet
gem install --no-ri --no-rdoc puppet

# Installing chef
gem install --no-ri --no-rdoc chef

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

# Ensure non-tty connections can sudo
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Reduce bootloader timeout
sed -i 's/timeout\ 10/timeout\ 3/g' /boot/grub/menu.lst
grub-install /dev/sda

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

exit
