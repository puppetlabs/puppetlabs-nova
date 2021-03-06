# == Class: nova::workarounds
#
# nova workarounds configuration
#
# === Parameters:
#
# [*never_download_image_if_on_rbd*]
#  (optional) refuse to boot an instance if it would require downloading from
#  glance and uploading to ceph instead of a COW clone
#  Defaults to $::os_service_default
#
# DEPRECATED
#
#  [*enable_numa_live_migration*]
#   (optional) Whether to enable live migration for NUMA topology instances.
#   Defaults to undef
#
class nova::workarounds (
  $never_download_image_if_on_rbd = $::os_service_default,
  # DEPRECATED PARAMETER
  $enable_numa_live_migration     = undef,
) {

  if $enable_numa_live_migration != undef {
    warning('The enable_numa_live_migration parameter is deprecated')
    nova_config {
      'workarounds/enable_numa_live_migration': value => $enable_numa_live_migration;
    }
  }

  nova_config {
    'workarounds/never_download_image_if_on_rbd': value => $never_download_image_if_on_rbd;
  }

}
