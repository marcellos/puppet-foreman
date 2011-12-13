import "tftp/manifests/*.pp"
import "xinetd/manifests/*.pp"

class foreman_proxy {

  include foreman_proxy::tftp
  include foreman_proxy::params
  include foreman_proxy::install
  include foreman_proxy::config
  include foreman_proxy::service
}
