include ::apache

apache::vhost { 'vhost.example.com':
  port    => '81',
  docroot => '/var/www/vhost',
}
file { 'index':
                path    => "/var/www/vhost/index.html",
                ensure  => file,
                require => Package['apache2'],
                content  => "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">

<p> Apache de prueba puppet con el Virtual Host</p>
</html>
",
       }
	
