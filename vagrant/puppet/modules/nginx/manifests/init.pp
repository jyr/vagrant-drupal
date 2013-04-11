class nginx (
		$ensure = 'latest',
		$default_vhost = false,
	) {

	$running = $ensure ? {
		absent => 'stopped',
		default => 'running',
	}

	$default_vhost_ensure = $default_vhost ? {
		true => 'link',
		default => 'absent',
	}

	package { 'nginx':
		ensure => $ensure,
	}

	service { 'nginx':
		ensure => $running,
		require => Package['nginx'],
	}
	
	file { '/var/www':
		ensure => directory,
		mode    => 755,
		owner   => root,
		group   => root,
	}

	file { '/etc/nginx/sites-enabled/default':
		ensure => $default_vhost_ensure,
		target => '/etc/nginx/sites-available/default',
		notify => Service['nginx'],
	}

}
