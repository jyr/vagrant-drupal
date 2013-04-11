#!/bin/bash

if [ -f /etc/apt/sources.list ]; then
	# Essentials
	apt-get update
	apt-get -q -y -o DPkg::Options::=--force-confold install build-essential
	apt-get -q -y -o DPkg::Options::=--force-confold install git-core
	apt-get -q -y -o DPkg::Options::=--force-confold install git-doc
	apt-get -q -y -o DPkg::Options::=--force-confold install zlib1g-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install openssl
	apt-get -q -y -o DPkg::Options::=--force-confold install libreadline-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libssl-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libyaml-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install libreadline-dev
	apt-get -q -y -o DPkg::Options::=--force-confold install tmux
	apt-get -q -y -o DPkg::Options::=--force-confold install vim
else
	echo "Your distribution is not supported by this StackScript"
	exit
fi
