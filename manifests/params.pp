# == Class: Komea Foundation::params
#
# This is a container class with default parameters for Komea Foundation classes.
class komea_dashboard_connectors::params {

  $version                   = "sprint"
  $jenkins_version           = "1.0.0"

  $cas_url                   = "http://localhost:8080/cas"

  $nexus_url                 = undef
  $nexus_repository          = "komea"
  $nexus_third_parties_repository = "komea-third-parties"
  $nexus_user                = undef
  $nexus_password            = undef

  $base_location             = "/opt/echoes/dashboard-connectors"
  $logs_location             = "/var/log"

  $jenkins_port              = 8099
  $jenkins_max_heap_size     = "128m"
  $jenkins_initial_heap_size = "32m"

  $connectors                = ['redmine-connector', 'git-connector', 'jenkins-connector', 'kiuwan-connector']

}
