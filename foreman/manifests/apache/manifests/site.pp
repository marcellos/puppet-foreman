define foreman::apache::site( $admin = "webmaster", $aliases = '', $docroot, $ensure = 'present', $rails = false) {
  if $rails { include passenger }

  file { "$foreman::apache::params::configdir/$name.conf":
    mode => "644",
    ensure => $ensure,
    require => Package["httpd"],
    notify => Exec["reload-apache"],
    content => template("foreman/vhost.conf"),
  } 
}

