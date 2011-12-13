class foreman::puppet::server::config inherits foreman::puppet::config {
  if $foreman::puppet::params::passenger  { include foreman::puppet::server::passenger }

  File ["${foreman::puppet::params::dir}/puppet.conf"] { 
  	content => template("foreman/puppet.conf.erb", "foreman/server/puppet.conf.erb") }

  file { [$foreman::puppet::params::modules_path, $foreman::puppet::params::common_modules_path]:
    ensure => directory,
  }

  exec {"generate_ca_cert":
    creates => "${foreman::puppet::params::ssl_dir}/certs/${::fqdn}.pem",
    command => "puppetca --generate ${::fqdn}",
    path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  }

  # setup empty directories for our environments
  env{$foreman::puppet::params::environments:}

  define env() {
    file{"$foreman::puppet::params::modules_path/$name": ensure => directory}  
  }
}
