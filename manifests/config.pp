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
}
