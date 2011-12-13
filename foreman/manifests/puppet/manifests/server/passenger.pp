class foreman::puppet::server::passenger {
  include foreman::apache::ssl
  include foreman::passenger

  file {"puppet_vhost":
    path    => "${foreman::puppet::params::apache_conf_dir}/puppet.conf",
    content => template("foreman/server/puppet-vhost.conf.erb"),
    mode    => 644,
    notify  => Exec["reload-apache"],
  }

  exec {"restart_puppet":
    command     => "/bin/touch ${foreman::puppet::params::app_root}/tmp/restart.txt",
    refreshonly => true,
    cwd         => $foreman::puppet::params::app_root,
    path        => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    require     => Class["foreman::puppet::server::install"]
  }

  file {
    [$foreman::puppet::params::app_root, "${foreman::puppet::params::app_root}/public", "${foreman::puppet::params::app_root}/tmp"]:
      ensure => directory,
      owner  => $foreman::puppet::params::user;
    "${foreman::puppet::params::app_root}/config.ru":
      owner  => $foreman::puppet::params::user,
      content => template("foreman/config.ru.erb"),
      notify => Exec["restart_puppet"];
  }

}
