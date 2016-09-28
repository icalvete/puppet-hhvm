class hhvm (

  $server_error_message = $hhvm::params::server_error_message

) inherits hhvm::params {

  anchor {'hhvm::begin':
    before => Class['hhvm::install']
  }
  class {'hhvm::install':
    require => Anchor['hhvm::begin']
  }
  class {'hhvm::config':
    require => Class['hhvm::install']
  }
  class {'hhvm::service':
    subscribe => Class['hhvm::config']
  }
  anchor {'hhvm::end':
    require => Class['hhvm::service']
  }
}
