date > /etc/vagrant_box_build_time

# Disable kernel upgrades as they will break manually built vbox guest additions
echo "/^kernel-desktop/" >> /etc/urpmi/skip.list
echo "/^kernel-server/" >> /etc/urpmi/skip.list

#urpmi.addmedia --distrib --mirrorlist '$MIRRORLIST'
urpmi.addmedia -q --distrib http://mirror.internode.on.net/pub/mageia/distrib/2/x86_64

urpme --auto -q kernel-server-latest

urpmi.update -aq
urpmi --auto --auto-select -q
urpmi --auto -q kernel-server-devel-`uname -r|sed 's/server-//g'|sed 's/desktop-//g'`
urpmi --auto -q gcc-c++ lib64zlib-devel lib64openssl-devel lib64readline-devel lib64sqlite3-devel
urpmi --auto -q puppet facter ruby-devel rubygems wget
urpmi --clean -q

# Disable puppet autostart
chkconfig puppet off

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
wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions_$VBOX_VERSION.iso
rm -f /home/vagrant/VBoxGuestAdditions_*.iso

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

exit