# Private class
class komea_dashboard_connectors::config (
  $port                   = $::komea_dashboard_connectors::port,
  $cas_url                = $::komea_dashboard_connectors::cas_url,
  $base_location          = $::komea_dashboard_connectors::base_location,
  $logs_location          = $::komea_dashboard_connectors::logs_location,
  $spring_boot_admin_url  = $::komea_dashboard_connectors::spring_boot_admin_url
) inherits komea_dashboard_connectors {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

}
