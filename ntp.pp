case $::operatingsystem{
	'Ubuntu':{
		notify{"Installing on Ubuntu":}
		package { 'ntp' :
		        ensure  => present,
        		before  => File["/etc/ntp.conf"],
			}

		file { "/etc/ntp.conf" :
        		ensure  => file,
        		mode    => 644,
			source  => '/root/learning-manifests/ntpd.conf'
		}
		service { 'ntp' :
                		ensure          => running,
                		enable          => true,
                		hasrestart      => true,
                		hasstatus       => true,
                		subscribe       => File['/etc/ntp.conf'],
		}

	}
	'RedHat':{
		notify{"Installing on RedHat":}
		package { 'ntpd' :
                        ensure  => present,
                        before  => File["/etc/ntpd.conf"],
                        }

                file { "/etc/ntpd.conf" :
                        ensure  => file,
                        mode    => 644,
			source 	=> '/root/learning-manifests/ntpd.conf' 
                }
		service { 'ntpd' :
                		ensure          => running,
                		enable          => true,
                		hasrestart      => true,
                		hasstatus       => true,
                		subscribe       => File['/etc/ntpd.conf'],
		}		


	}
}

	
