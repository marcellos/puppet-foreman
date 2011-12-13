class foreman_proxy::install {
 
#This dependency on the foreman module might be overkill and probably should be solved in a better way  
  require "foreman::params"
  include foreman::install::repos
  
  package {"foreman-proxy":
    ensure => installed,
    require => Class["foreman::install::repos"],
  }
}
