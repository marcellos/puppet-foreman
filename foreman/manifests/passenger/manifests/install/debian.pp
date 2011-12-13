class foreman::passenger::install::debian {

  package{"passenger":
    name    => "libapache2-mod-passenger",
    ensure  => installed,
    require => Class["foreman::apache::install"],
    before  => Class["foreman::apache::service"],
  }

}
