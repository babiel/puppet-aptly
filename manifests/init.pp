# == Class: aptly
#
# Main class. See README.markdown for more documentation.
#
class aptly (
  String $version                   = $aptly::params::version,
  Boolean $install_repo             = $aptly::params::install_repo,
  String $repo_location             = $aptly::params::repo_location,
  String $repo_release              = $aptly::params::repo_release,
  String $repo_repos                = $aptly::params::repo_repos,
  String $repo_keyserver            = $aptly::params::repo_keyserver,
  Pattern[/^[A-F0-9]+$/] $repo_key  = $aptly::params::repo_key,
  Boolean $enable_service           = $aptly::params::enable_service,
  Integer[default, 49150] $port     = $aptly::params::port,
  Stdlib::IP::Address $bind         = $aptly::params::bind,
  String $config_filepath           = $aptly::params::config_filepath,
  String $user                      = $aptly::params::user,
  Integer $uid                      = $aptly::params::uid,
  String $group                     = $aptly::params::group,
  Integer $gid                      = $aptly::params::gid,
  String $root_dir                  = $aptly::params::root_dir,
  Array $architectures              = $aptly::params::architectures,
  String $ppa_dist                  = $aptly::params::ppa_dist,
  String $ppa_codename              = $aptly::params::ppa_codename,
  Hash $properties                  = $aptly::params::properties,
  Hash $s3_publish_endpoints        = $aptly::params::s3_publish_endpoints,
  Hash $swift_publish_endpoints     = $aptly::params::swift_publish_endpoints,
  Boolean $enable_api               = $aptly::params::enable_api,
  Integer[default, 49150] $api_port = $aptly::params::api_port,
  Stdlib::IP::Address $api_bind     = $aptly::params::api_bind,
  Boolean $api_nolock               = $aptly::params::api_nolock,
  Boolean $manage_xz_utils          = $aptly::params::manage_xz_utils,
) inherits aptly::params {

  class { 'aptly::install': } -> class { 'aptly::config':  } ~> class { 'aptly::service': } -> Class['aptly']

  # Ensure Aptly is installed and configured before using it
  Class['aptly::config'] -> Aptly::Mirror <| |>
  Class['aptly::config'] -> Aptly::Publish <| |>
  Class['aptly::config'] -> Aptly::Repo <| |>
  Class['aptly::config'] -> Aptly::Snapshot <| |>
}
