class foreman::apache {
  include foreman::apache::params
  include foreman::apache::install
  include foreman::apache::config
  include foreman::apache::service
}
