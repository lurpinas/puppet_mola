if ($::operatingsystem == "Ubuntu") {
	notify{"Installing on Ubuntu - in the if statement":}
	
}

case $::operatingsystem{
	debian,ubuntu:{
		notify{"Installing on Ubuntu - in the case statement":}
		
		package { 'gcc':
	                ensure => 'installed',
        	}
		
		package { 'build-essential':
        	        ensure => 'installed',
        	}
	

	}
	centos,redhat:{
		notify{"Installing on RedHat":}
		package { 'gcc':
                ensure => 'installed',
        	}

	}
}	
