Veewee::Session.declare({
  :cpu_count => '2',
  :memory_size=> '512',
  :disk_size => '10140',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :virtualbox => { :vm_options => ["ioapic" => "on"]}
  :virtualbox => { :vm_options => ["pae" => "on"]}
  :os_type_id => 'RedHat_64',
  :iso_file => "CentOS-6.3-x86_64-netinstall.iso",
  :iso_src => "http://mirror.aarnet.edu.au/pub/centos/6.3/isos/x86_64/CentOS-6.3-x86_64-netinstall.iso",
  :iso_md5 => "690138908de516b6e5d7d180d085c3f3",
  :iso_download_timeout => 1000,
  :boot_wait => "15",
  :boot_cmd_sequence => [ '<Tab> text ks=http://%IP%:%PORT%/ks.cfg<Enter>' ],
  :kickstart_port => "7122",
  :kickstart_timeout => 10000,
  :kickstart_file => "ks.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/halt -h -p",
  :postinstall_files => [ "postinstall.sh"],
  :postinstall_timeout => 10000
})
