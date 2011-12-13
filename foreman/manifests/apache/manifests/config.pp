class foreman::apache::config {

  group { $foreman::apache::params::group: 
    ensure => present, 
    require => Class["foreman::apache::install"] 
  }
  user  { $foreman::apache::params::user:
    ensure     => present,
    home       => $foreman::apache::params::home,
    managehome => false,
    membership => minimum,
    groups     => [],
    shell      => "/sbin/nologin",
    require    => Group[$foreman::apache::params::group],
  }

  file{
    "$foreman::apache::params::configdir/$foreman::apache::params::conffile":
      mode    => 0644,
      notify  => Exec["reload-apache"],
      require => Class["foreman::apache::install"];
    "$foreman::apache::params::configdir/":
      ensure  => directory,
      mode    => 0644,
      notify  => Exec["reload-apache"],
      require => Class["foreman::apache::install"],
  }

}
