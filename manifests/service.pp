class rrdtool::service inherits rrdtool {

  #
  validate_bool($rrdtool::manage_docker_service)
  validate_bool($rrdtool::manage_service)
  validate_bool($rrdtool::service_enable)

  validate_re($rrdtool::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${rrdtool::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $rrdtool::manage_docker_service)
  {
    if($rrdtool::manage_service)
    {
      service { $rrdtool::params::service_name:
        ensure => $rrdtool::service_ensure,
        enable => $rrdtool::service_enable,
      }
    }
  }
}
