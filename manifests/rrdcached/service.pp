class rrdtool::rrdcached::service inherits rrdtool::rrdcached {
  #
  validate_bool($rrdtool::rrdcached::manage_docker_service)
  validate_bool($rrdtool::rrdcached::manage_service)
  validate_bool($rrdtool::rrdcached::service_enable)

  validate_re($rrdtool::rrdcached::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${rrdtool::rrdcached::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $rrdtool::rrdcached::manage_docker_service)
  {
    if($rrdtool::rrdcached::manage_service)
    {
      service { $rrdtool::params::rrdcached_name:
        ensure => $rrdtool::rrdcached::service_enable,
        enable => $rrdtool::rrdcached::service_enable,
      }
    }
  }

}
