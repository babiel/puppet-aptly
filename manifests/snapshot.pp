# == Define aptly::snapshot
#
# This definition is meant to be called from aptly.
# It manages APT Mirrors.
#
define aptly::snapshot (
  String $source_type,
  String $source_name,
  Variant[Enum['present', 'absent', 'purged', 'disabled', 'installed', 'latest'], String[1]] $ensure = 'present',
  Integer $uid    = 450,
  Integer $gid    = 450,
) {

  aptly_snapshot { $name:
    ensure      => $ensure,
    uid         => $uid,
    gid         => $gid,
    source_type => $source_type,
    source_name => $source_name,
  }
}
