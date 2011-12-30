class foreman_proxy::apache::ssl {
  include foreman_proxy::apache

  case $operatingsystem {
    Debian,Ubuntu:  {
      exec { "enable-ssl":
        command => "/usr/sbin/a2enmod ssl",
        creates => "/etc/apache2/mods-enabled/ssl.load",
        notify  => Service["httpd"],
        require => Class["foreman_proxy::apache::install"],
      }
    }
    default: {
      package { "mod_ssl":
        ensure => present, require => Package["httpd"],
        notify => Class["foreman_proxy::apache::service"],
      }
      file {
        "$foreman_proxy::apache::params::configdir/ssl.conf":
          mode => 0644, owner => root, group => root,
          notify => Exec["reload-apache"];
        ["/var/cache/mod_ssl", "/var/cache/mod_ssl/scache"]:
          ensure => directory,
          owner => apache, group => root, mode => 0700,
          notify => Exec["reload-apache"];
      }
    }
  }
}