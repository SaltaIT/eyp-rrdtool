class rrdtool(
              $manage_package        = true,
              $package_ensure        = 'installed',
            ) inherits rrdtool::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::rrdtool::install': }
  -> class { '::rrdtool::config': }
  -> Class['::rrdtool']

}
