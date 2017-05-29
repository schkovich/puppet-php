define php::extension::reconfigure (
  $ensure,
  $package,
  $sapis    = ['cli', 'fpm', 'apache2'],
  $priority = 20,
) {
  $uniqe_sapis = suffix($sapis, $package)
  php::sapi { $uniqe_sapis:
    extension => $package,
    ensure    => $ensure,
    priority  => $priority,
    require   => Package[$package],
  }

}