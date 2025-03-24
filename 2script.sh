#!/bin/bash

if [ $UID -ne 0 ]; then
	echo "Please run this script with sudo."
	exit 1
fi

if [ $# -ne 2 ]; then
	echo " [ ERROR ] Incorrect number of arguments ! "
	echo " * Input a relative route and a -r, -w or -x argument."
else
	if [ -f $1 ]; then
		echo "$1 is a file"
		if [ $2 = "-r" -o $2 = "-w" -o $2 = "-x" ]; then
			echo "$2 is correct"
			#aqui van las cosas vvvv

			allPerms=$(stat $1 -c %A)
			groupPerms=${allPerms:4:3}
			userPerms=${allPerms:1:3}
			otherPerms=${allPerms:7:3}

			fileOwner=$(stat $1 -c %U)
			groupOwner=$(stat $1 -c %G)


			echo "User Permissions: $userPerms"
			echo "Group Permissions: $groupPerms"
			echo "Other Permissions: $otherPerms"
			echo "The Owner: $fileOwner"
			echo "The Owners (Group): $groupOwner "

			if [ $2 = "-r" ]; then

				echo $userPerms | grep 
			fi
		else
			echo "[ ERROR ] Invalid argument."
		fi
	else
		echo "[ ERROR ] $1 is not a directory, it doesn't exist or it isn't there. :( "
	fi
fi
