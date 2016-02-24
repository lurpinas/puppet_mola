if ($::operatingsystem == "Ubuntu") and ($::is_virtual == true) {
	notify{"Installing on Ubuntu - in the if statement":}
}

case $::operatingsystem{
	'Ubuntu':{
		notify{"Installing on Ubuntu - in the case statement":}
	}
	'RedHat':{
		notify{"Installing on RedHat":}
	}
}	
