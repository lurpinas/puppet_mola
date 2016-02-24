file{ '/tmp/test5':
	ensure 	=> present,
	content => "Hi.",
}

notify {'after':
	message => '/tmp/test5 has already been synced.',
}

File['/tmp/test5'] <~ Notify['after']
