class foreman::puppet {
  include foreman::puppet::params
  include foreman::puppet::install
  include foreman::puppet::config
}
