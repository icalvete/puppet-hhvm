class hhvm::install {

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
