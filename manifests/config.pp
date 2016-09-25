class hhvm::config {

  exec { 'rc_d_hhvm':
    command  => 'update-rc.d hhvm defaults',
    user     => 'root',
    provider => 'shell',
  }

  exec { 'alternatives_hhvm':
    command  => '/usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60',
    user     => 'root',
    provider => 'shell',
  }

  #augeas{'hhvm_ext_dir':
  #  context => "/${hhvm::params::config_file}/PHP",
  #  changes => [
  #    "set hhvm.extensions[mongodb] mongodb.so",
  #  ]
  #}

  file { 'hhvm_config_dir':
    ensure => directory,
    path   => $hhvm::params::config_dir,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }

  file { 'hhvm_config_file':
    ensure  => file,
    path    => $hhvm::params::config_file,
    content => template("${module_name}/php.ini.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['hhvm_config_dir'],
  }
}
