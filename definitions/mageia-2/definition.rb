Veewee::Session.declare({
  :cpu_count => '2',
  :memory_size=> '512',
  :disk_size => '10140',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'RedHat_64',
  :iso_file => "boot-nonfree.iso",
  :iso_src => "http://mirror.internode.on.net/pub/mageia/distrib/2/x86_64/install/images/boot-nonfree.iso",
  :iso_md5 => "4a0ed5f18c1aa20f42728efd995ba040",
  :iso_download_timeout => 1000,
  :boot_wait => "4",
  :boot_cmd_sequence => [
     'linux automatic=met:http,netw:dhcp,hos:veewee,ser:mirror.internode.on.net,dir:pub/mageia/distrib/2/x86_64, kickstart=http://%IP%:%PORT%/auto_inst.cfg<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => 10000,
  :kickstart_file => "auto_inst.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "shutdown -h now",
  :postinstall_files => [ "postinstall.sh"],
  :postinstall_timeout => 10000
})
