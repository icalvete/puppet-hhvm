class hhvm::install {


  file { 'hhvm_lib_dir':
    ensure => directory,
    path   => $hhvm::params::lib_dir,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
    before => [Package['hhvm'], File['hhvm_extension_dir']]
  }


  file { 'hhvm_extension_dir':
    ensure => directory,
    path   => "${hhvm::params::lib_dir}/extensions",
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
    before => Package['hhvm']
  }

  file{'hhvm_mongo_ext':
    ensure  => present,
    path    => "${hhvm::params::lib_dir}/extensions/mongodb.so",
    source  => "puppet:///modules/${module_name}/mongodb.so",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['hhvm_extension_dir']
  }

  apt::source { "archive.ubuntu.com-${lsbdistcodename}":
    location      => 'http://dl.hhvm.com/ubuntu',
    key           => '0x5a16e7281be7a449',
    release       => $lsbdistcodename,
    repos         => 'main',
    before        => Package['hhvm'],
    notify_update => true
  }

  package { 'hhvm':
    ensure  => present,
    require => Class['apt::update']
  }
}
