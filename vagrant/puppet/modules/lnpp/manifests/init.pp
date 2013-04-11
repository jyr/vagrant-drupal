class lnpp {

	class { 'apt': 
		always_apt_update	=> true,
	}

	Package { 
		ensure => "latest",
		require => Class['apt']
	}
	

	package { 'php5': }
	package { 'imagemagick': }
	package { 'php5-fpm': }
	package { 'php5-pgsql': }
	package { 'php5-common': }
	package { 'php5-dev': }
	package { 'php-pear': }
	package { 'php5-curl': }
	package { 'php5-gd': }
	package { 'php5-imagick': }
	package { 'php5-mcrypt': }
	package { 'php5-suhosin': }
	package { 'drush': }
	include nginx

	class { 'postgresql::server':
		config_hash => {
			'ip_mask_deny_postgres_user' => '0.0.0.0/32',
			'ip_mask_allow_all_users'    => '0.0.0.0/0',
			'listen_addresses'           => '*',
			'postgres_password'          => 'secret',
		},
	}
	
	service { 'php5-fpm':
		ensure			=> running,
		hasstatus 	=> true,
		enable      => true,
		require     => [Package[php5], Package['php5-fpm']],
		restart     => '/etc/init.d/php5-fpm reload',
	}
}
