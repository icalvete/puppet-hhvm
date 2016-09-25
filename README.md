# puppet-hhvm

Puppet manifest to install and configure hhvm

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-hhvm.png)](http://travis-ci.org/icalvete/puppet-hhvm)

See [hhvm site](http://hhvm.com/)

##Requires:

* https://github.com/smartpurposes/puppet-modules.git
* https://github.com/puppetlabs/puppetlabs-apt.git
* https://github.com/icalvete/puppet-roles.git
* https://github.com/icalvete/puppet-apache2.git

##Example:


```puppet

node 'ubuntu01.smartpurposes.net' inherits test_defaults {
  class {'roles::apache2_server':
    php                    => false,
    hhvm                   => true
    passenger              => false,
  }
}
	        
```

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
