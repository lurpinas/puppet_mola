package {'apache2':
	ensure 	=> installed,
}

file {'/etc/apache2/sites-enabled/000-default.conf':
 	ensure  => file,
        mode    => 750,
        content => "<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/html
	ErrorLog /var/log/apache2/error.log
	CustomLog /var/log/apache2/access.log combined
	</VirtualHost>"
}

service {'apache2':
        ensure          => running,
}	
