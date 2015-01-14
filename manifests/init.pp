class stig_generic (
  $ipv6enabled = false
){

  if ($::operatingsystem == 'RedHat') { 
  #RHEL-06-000009 - Only RedHat OS since variants don't use satellite.
    service { 'rhnsd':
      ensure => 'stopped',
      enable => false,
    }
  }
  #RHEL-06-000045, RHEL-06-000046
  file { ['/lib', '/lib64', '/usr/lib', '/usr/lib64']:
    owner => 'root',
    group => 'root',
    mode  => '0555',
  }
  #RHEL-06-000047, RHEL-06-000048
  file { ['/bin', '/usr/bin', '/usr/local/bin', '/sbin', '/usr/sbin', '/usr/local/sbin']:
    owner => 'root',
    group => 'root',
    mode  => '0555',
  }

  #RHEL-06-000071
  package { 'screen':
    ensure => 'installed',
  }
  if ($ipv6enabled) {
  #RHEL-06-000103, RHEL-06-000106, RHEL-06-000107
    service { 'ip6tables':
      ensure => 'running',
      enable => true,
    }
  }
  #RHEL-06-000204, RHEL-05-000203
  package { 'xinetd':
    ensure => 'absent',
  }
  #RHEL-06-000206, RHEL-06-000211
  package { 'telnet-server':
    ensure => 'absent',
  }
  #RHEL-06-000213, RHEL-06-000214
  package { 'rsh-server':
    ensure => 'absent',
  }
  #RHEL-06-000216
  service { 'rexec':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000218
  service { 'rlogin':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000220
  package { 'ypserv':
    ensure => 'absent',
  }
  #RHEL-06-000221
  service { 'ypbind':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000222, RHEL-06-000223
  package { 'tftp-server':
    ensure => 'absent',
  }
  #RHEL-06-000224
  service { 'crond':
    ensure => 'running',
    enable => true,
  }
  #RHEL-06-000246
  service { 'avahi-daemon':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000256
  package { 'openldap-servers':
    ensure => 'absent',
  }
  #RHEL-06-000261
  service { 'abrtd':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000262
  service { 'atd':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000265
  service { 'ntpdate':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000267
  service { 'qpidd':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000268
  service { 'rdisc':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000288
  package { 'sendmail':
    ensure => 'absent',
  }
  #RHEL-06-000289
  service { 'netconsole':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000291
  package { 'xorg-x11-server-common':
    ensure => 'absent',
  }
  #RHEL-06-000321
  package { 'openswan':
    ensure => 'installed',
  }
  #RHEL-06-000331
  service { 'bluetooth':
    ensure => 'stopped',
    enable => false,
  }
  #RHEL-06-000526
  service { 'autofs':
    ensure => 'stopped',
    enable => false,
  }
  #2.4.3
  package { 'setroubleshoot':
    ensure => 'absent',
  }
  package { 'mctrans':
    ensure => 'absent',
  }
  #3.17/3.12
  package { 'dovecot':
    ensure => 'absent',
  }

  
}
