define php::extension::reconfigure (
  $ensure,
  $extension,
  $sapis    = ['cli', 'fpm', 'apache2'],
  $priority = 20,
) {

  $uniqe_sapis = suffix($sapis, $title)

  php::sapi { $uniqe_sapis:
    extension => $extension,
    ensure    => $ensure,
    priority  => $priority,
    require   => Package["php5-${extension}"],
  }
}
