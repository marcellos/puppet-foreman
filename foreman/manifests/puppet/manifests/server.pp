class foreman::puppet::server {
  include foreman::puppet::server::install
  include foreman::puppet::server::config
}
