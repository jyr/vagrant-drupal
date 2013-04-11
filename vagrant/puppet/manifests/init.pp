Package { 
	ensure => "latest",
}

package { 'build-essential': }
package { 'git-core': }
package { 'git-doc': }
package { 'tmux': }
package { 'vim': }
	
	file { "/var/www/core":
		ensure => 'directory',
		owner  => 'root',
		group  => 'root',
		mode   => 644,
		require => [ File["/var/www"] ]
	}

include lnpp

	nginx::vhost { 'blog.nuperty.com':
		root     => '/var/www/core',
		ensure   => present,
		file     => 'blog.nuperty.com',
		server_name    => 'blog.nuperty.com',
		template => 'nginx/vhost.drupal.conf.erb',
	}
	postgresql::db { 'blog_db':
		user     => 'blog_user',
		password => 'secret',
		grant    => 'all'
	}

	nginx::vhost { 'news.nuperty.com':
		root     => '/var/www/core',
		ensure   => present,
		file     => 'news.nuperty.com',
		server_name    => 'news.nuperty.com',
		template => 'nginx/vhost.drupal.conf.erb',
	}

	postgresql::db { 'news_db':
		user     => 'news_user',
		password => 'secret',
		grant    => 'all'
	}



