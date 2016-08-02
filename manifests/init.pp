class komea_dashboard_connectors (
  $version                = $::komea_dashboard_connectors::params::version,
  $jenkins_version        = $::komea_dashboard_connectors::params::jenkins_version,
  $cas_url                = $::komea_dashboard_connectors::params::cas_url,
  $nexus_repository       = $::komea_dashboard_connectors::params::nexus_repository,
  $nexus_third_parties_repository = $::komea_dashboard_connectors::params::nexus_third_parties_repository,
  $nexus_url              = $::komea_dashboard_connectors::params::nexus_url,
  $nexus_user             = $::komea_dashboard_connectors::params::nexus_user,
  $nexus_password         = $::komea_dashboard_connectors::params::nexus_password,
  $base_location          = $::komea_dashboard_connectors::params::base_location,
  $logs_location          = $::komea_dashboard_connectors::params::logs_location,
  $jenkins_port           = $::komea_dashboard_connectors::params::jenkins_port,
  $jenkins_max_heap_size  = $::komea_dashboard_connectors::params::jenkins_max_heap_size,
  $jenkins_initial_heap_size = $::komea_dashboard_connectors::params::jenkins_initial_heap_size,
  $connectors             = $::komea_dashboard_connectors::params::connectors
) inherits komea_dashboard_connectors::params {

  anchor { "${module_name}::begin": } ->
  class { "${module_name}::install": } ->
  class { "${module_name}::config": } ~>
  class { "${module_name}::service": } ->
  anchor { "${module_name}::end": }

}
