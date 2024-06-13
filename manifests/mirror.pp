# == Define aptly::mirror
#
# Manages an apt mirror.
#
define aptly::mirror (
  String $location,
  Variant[Enum['present', 'absent', 'purged', 'disabled', 'installed', 'latest'], String[1]] $ensure = 'present',
  Integer $uid                   = 450,
  Integer $gid                   = 450,
  String $distribution           = $facts['os']['distro']['codename'],
  Array $architectures           = [],
  Array $components              = [],
  Boolean $with_sources          = false,
  Boolean $with_udebs            = false,
  Variant[String, Undef] $filter = undef,
  Boolean $filter_with_deps      = false,
  Boolean $with_installer        = false,
) {

  aptly_mirror { $name:
    ensure           => $ensure,
    uid              => $uid,
    gid              => $gid,
    location         => $location,
    distribution     => $distribution,
    architectures    => $architectures,
    components       => $components,
    with_sources     => $with_sources,
    with_udebs       => $with_udebs,
    filter           => $filter,
    filter_with_deps => $filter_with_deps,
    with_installer   => $with_installer,
  }
}
