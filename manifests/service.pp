# Private class
class komea_dashboard_connectors::service inherits komea_dashboard_connectors {

  if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
  }

  service { 'jenkins':
    ensure => running,
    start   => "/etc/init.d/jenkins start",
    stop    => "/etc/init.d/jenkins stop",
    status  => "/etc/init.d/jenkins status",
  }

}
