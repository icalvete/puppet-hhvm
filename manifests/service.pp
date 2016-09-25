class hhvm::service {

  service { 'hhvm':
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
  }
}
