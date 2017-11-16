#

# [Unit]
# Description=Data caching daemon for rrdtool
# After=network.service
#
# [Service]
# Type=forking
# PIDFile=/run/rrdcached.pid
# ExecStart=/usr/bin/rrdcached -w 1800 -z 1800 -f 3600 -s librenms -U librenms -G librenms -B -R -j /var/tmp -l unix:/run/rrdcached.sock -t 4 -F -b /opt/librenms/rrd/
#
# [Install]
# WantedBy=default.target

# $username              = 'daemon',
# $group                 = 'daemon',
# $write_threads         = '4',
# $write_timeout         = '1800',
# $write_jitter          = '1800',
# lisetn

class rrdtool::rrdcached::config inherits rrdtool::rrdcached {

  systemd::service { $rrdtool::params::rrdcached_name:
    description => 'Data caching daemon for rrdtool',
    after_units => [ 'network.service' ],
    type        => 'forking',
    pid_file    => $rrdtool::rrdcached::pid_file,
    execstart   => template("${module_name}/rrdcached/execstart.erb"),
    user        => $rrdtool::rrdcached::username,
    group       => $rrdtool::rrdcached::group,
  }
}
