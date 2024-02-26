define puppetserver::config::helper (
  $type,
  $setting,
  $setting_type = undef,
) {
  $split_name = split($name, '/')
  $section = $split_name[0]
  $key = $split_name[1]

  if $section in $::puppetserver::config {
    if $key in $::puppetserver::config[$section] {
      ensure_resource("puppetserver::config::${type}", $setting, {
          ensure       => 'present',
          value        => $::puppetserver::config[$section][$key],
          setting_type => $setting_type,
        })
    }
  }
}
