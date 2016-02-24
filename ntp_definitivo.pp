class ntp {
case $operatingsystem {
	centos,redhat: {
		$service_name 	= 'ntpd'
		$conf_file 	= 'ntpd.conf'
	}
	debian,ubuntu: {
		$service_name 	= 'ntp'
                $conf_file 	= 'ntp.conf'
	}
}

package { 'ntp':
	ensure => installed,
}

if $is_virtual == 'true' {
	service {'ntp':
		name 	=> $service_name,
		ensure 	=> stopped,
		enable 	=> false,
	}
}
else {
	
	service { 'ntp' :
		name 		=> $service_name,
		ensure 		=> running,
		enable 		=> true , 
		subscribe 	=> File['ntp.conf'],
		hasrestart 	=> true,
		require 	=> Package['ntp'],
	}
}
file { 'ntp.conf':
	path 	=> '/etc/ntp.conf',
	ensure 	=> file,
	require => Package['ntp'],
	source 	=> "/root/learning-manifests/$conf_file",
}
}

class {'ntp':}
