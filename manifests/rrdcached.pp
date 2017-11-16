class rrdtool::rrdcached(
                          $manage_service        = true,
                          $manage_docker_service = true,
                          $service_ensure        = 'running',
                          $service_enable        = true,
                          $username              = 'root',
                          $group                 = 'root',
                          $write_threads         = '4',
                          $flush_interval        = '3600',
                          $write_interval        = '1800',
                          $write_jitter          = undef,
                          $listen                = '127.0.0.1:42217',
                          $journal_dir           = '/var/tmp',
                          $socket_group          = undef,
                          $basedir               = '/var/lib/rrd',
                          $pid_file              = '/run/rrdcached.pid',
                          $restrict_file_access  = true,
                        ) inherits rrdtool::params{

  class { '::rrdtool::rrdcached::install': }
  -> class { '::rrdtool::rrdcached::config': }
  ~> class { '::rrdtool::rrdcached::service': }
  -> Class['::rrdtool::rrdcached']

}
