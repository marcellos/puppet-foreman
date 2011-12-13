class foreman::puppet::config {
  file {
    $foreman::puppet::params::dir: ensure => directory;
    "${foreman::puppet::params::dir}/puppet.conf": content => template("foreman/puppet.conf.erb");
  }
  
}
