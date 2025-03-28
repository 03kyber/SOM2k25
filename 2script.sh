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
		echo "[:)] $1 is a valid file"
		if [ $2 = "-r" -o $2 = "-w" -o $2 = "-x" ]; then
			echo "$2 is correct"

			allPerms=$(stat $1 -c %A)
			groupPerms=${allPerms:4:3}
			userPerms=${allPerms:1:3}
			otherPerms=${allPerms:7:3}

			fileOwner=$(stat $1 -c %U)
			groupOwner=$(stat $1 -c %G)

			if [ $2 = "-r" ]; then
				paramToSearch="r"
				permText="Read"
			fi
			if [ $2 = "-w" ]; then
				paramToSearch="w"
				permText="Write"
			fi
			if [ $2 = "-x" ]; then
				paramToSearch="x"
				permText="Execute"
			fi

			rc=0
			permUser="True"
			permGroup="True"
			permOthers="True"

			echo $userPerms | grep "$paramToSearch" || rc=1
			if [ $rc -eq "1" ]; then
				echo "No $permText permissions"
				permUser="False"
				rc=0
			fi
			echo $groupPerms | grep "$paramToSearch" || rc=1
			if [ $rc -eq "1" ]; then
				echo "No $permText permissions"
				permGroup="False"
				rc=0
			fi
			echo $otherPerms | grep "$paramToSearch" || rc=1
			if [ $rc -eq "1" ]; then
				echo "No $permText permissions"
				permOthers="False"
				rc=0
			fi

			echo " "
			echo "Owner : $fileOwner - $permText Permissions: $permUser"
			echo "Group: $groupOwner - $permText Permissions: $permGroup"
			echo "Other: $permText Permissions: $permOthers"
			echo " "
		else
			echo "[ ERROR ] Invalid argument."
		fi
	else
		echo "[ ERROR ] $1 is not a directory, it doesn't exist or it isn't there. :( "
	fi
fi
