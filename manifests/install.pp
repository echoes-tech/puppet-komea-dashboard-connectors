# Private class
class komea_dashboard_connectors::install (
  $version                = $::komea_dashboard_connectors::version,
  $jenkins_version        = $::komea_dashboard_connectors::jenkins_version,
  $nexus_url              = $::komea_dashboard_connectors::nexus_url,
  $nexus_repository       = $::komea_dashboard_connectors::nexus_repository,
  $nexus_third_parties_repository = $::komea_dashboard_connectors::nexus_third_parties_repository,
  $nexus_user             = $::komea_dashboard_connectors::nexus_user,
  $nexus_password         = $::komea_dashboard_connectors::nexus_password,
  $base_location          = $::komea_dashboard_connectors::base_location,
  $jenkins_port           = $::komea_dashboard_connectors::jenkins_port,
  $jenkins_max_heap_size  = $::komea_dashboard_connectors::jenkins_max_heap_size,
  $jenkins_initial_heap_size = $::komea_dashboard_connectors::jenkins_initial_heap_size,
  $connectors             = $::komea_dashboard_connectors::connectors
)inherits komea_dashboard_connectors {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { [ "$base_location" ]:
    ensure  => 'directory',
    mode    => '0755'
  }

  $jenkins_path="$base_location/komea-jenkins"
  $connector_path="$base_location/connectors"

  file { "$jenkins_path":
    ensure  => 'directory',
    mode    => '0755'
  }

  file { "$connector_path":
    ensure  => 'directory',
    mode    => '0755'
  }

  file { "/etc/init.d/jenkins":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/jenkins.sh.erb")
  }

  file { "${base_location}/nexus_deploy_connectors.sh":
    ensure  => "present",
    owner   => "root",
    group   => 'root',
    mode    => '0770',
    content => template("${module_name}/nexus_deploy_connectors.sh.erb")
  }

  exec { "deploy-nexus-connectors":
    path    => ['/usr/bin', '/usr/sbin', '/bin'],
    command => "${base_location}/nexus_deploy_connectors.sh ${nexus_user} ${nexus_password}",
    timeout => 0
  }

}
