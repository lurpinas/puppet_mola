file{"/etc/motd":
	ensure 	=> present, 
	content	=> "This is the MOTD\n",
	owner	=> 'root',
	mode 	=> '0755',
}
