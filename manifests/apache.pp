class profile::apache {
  class { '::apache':
    default_vhost => true,
  }

  $docroot = "/var/www/${facts['fqdn']}" 

  ::apache::vhost { $facts['fqdn']:
    port => 80,
    docroot => $docroot,
    before => File["${docroot}/index.html"],
  }

  file { "${docroot}/index.html":
    content => "Test page. This is a test", 
  }
}

