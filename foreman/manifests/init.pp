# Class: foreman
#
# This module manages foreman
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
import "apache/manifests/*.pp"
import "passenger/manifests/*.pp"
import "puppet/manifests/*.pp"

class foreman {
  include foreman::params
  include foreman::install
  include foreman::config
  include foreman::service

}
