class rrdtool::install inherits rrdtool {

  if($rrdtool::manage_package)
  {
    package { $rrdtool::params::package_name:
      ensure => $rrdtool::package_ensure,
    }
  }

}
