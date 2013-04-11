# Drupal Multisites

## Overview

Building faster deployments for Drupal.

## Vagrant 

    $ vagrant box add vagrant-drupal http://files.vagrantup.com/precise64.box
	$ vagrant init
	$ vagrant up

## Drupal

#### Initialize

Copy drupal files to /var/www/core or create alias ex.
    
    sudo ln -s /home/vagrant/project/drupal /var/www/core

#### From browser

	* http://blog.nuperty.com:8080/
	* http://news.nuperty.com:8080/

## SQL

Is a directory for backups