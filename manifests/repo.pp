# == Define aptly::repo
#
# Manages an apt repo.
#
define aptly::repo (
  Variant[Enum['present', 'absent', 'purged', 'disabled', 'installed', 'latest'], String[1]] $ensure = 'present',
  Integer $uid                  = 450,
  Integer $gid                  = 450,
  String $default_distribution  = $facts['os']['distro']['codename'],
  String $default_component     = 'main',
) {

  aptly_repo { $name:
    ensure               => $ensure,
    uid                  => $uid,
    gid                  => $gid,
    default_distribution => $default_distribution,
    default_component    => $default_component,
  }
}
