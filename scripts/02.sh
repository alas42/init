#!/bin/bash

if [ -z $1 ]
then
	echo "Enter something please"
	exit 1
else
	if [ "$(getent passwd $1)" ] && [ $1 != "nobody" ]; then
		uid= `id -u $1`
		pkill -U $1
		userdel -r -f "$1"
	else
		echo "Please, enter a valid username, $1 does not exist."
	fi	
fi
