#!/bin/bash

echo -e "Hello\nIf you are new then type 'help' to see what you can do."
read input
while [ -z $input ]; do
	echo "Please, put something in."
done
if [ "$input" == "help" ]; then
	echo -e "You can choose to install a config to start working (includes sudo && vim && ssh && git && curl && transform a user in superuser) in typing 'install'."
	read input
fi
while [ -z $input ]; do
	echo "Please, put something in."
done
if [ "$input" == "install" ]; then
	echo "-Install sudo-"
	apt install sudo
	echo "-Get updates-"
	apt-get update
	echo "-Install ssh-"
	apt-get install openssh-server
	echo "-Install vim-"
	apt-get install vim
	echo "-Intall git-"
	apt-get install git
	echo "-Install CURL-"
	apt-get install curl
	echo "Enter name of user to add him to the superusers"
	read name
	while [ -z $name ]; do
		echo "Put the name of the user."
		read name
	done
	while [ -z "$(getent passwd $name)" ]; do
		echo "User does not exist, enter another one"
		read name
	done
	usermod -aG sudo $name
	echo "user added to superusers list, you can run commands with 'sudo' now"
else 
	echo "this is useless"
fi
