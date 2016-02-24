package { "apache2" :
        ensure => present,
    }

service{ "apache2":
	require => Package['apache2'],
	ensure 	=> running,
}

