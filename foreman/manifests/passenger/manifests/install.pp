class foreman::passenger::install {
  case $::operatingsystem {
    redhat,centos,fedora,Scientific: { include foreman::passenger::install::redhat }
    Debian,Ubuntu: { include foreman::passenger::install::debian }
    default: { fail("${::hostname}: This module does not support operatingsystem $::operatingsystem") }
  }
}
