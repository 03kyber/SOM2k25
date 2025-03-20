#!/bin/bash
totalUsers=$(cat /etc/passwd | wc -l)
if [ $# -lt 1 ]; then
	echo "[ ERROR ] Not enough arguments provided."
	exit 1
fi

#Check if users exist.

for u in $@; do

	rc=0
	cat /etc/passwd | grep -qi "^$u:" || rc=1
	if [ $rc -eq 1 ]; then
		echo "[ ERROR ] The user $u doesn't exist"
	else
		echo " * User $u exists "
		let procUsers=$procUsers+1
		userId=$(cat /etc/passwd | grep "^$u:" | cut -d ":" -f 3)

		if [ $userId -lt 1000 ]; then
			let sysUsers=$sysUsers+1
			echo ">> This is a system user"
			usrFolder=$(cat /etc/passwd | grep "^$u:" | cut -d ":" -f 6)
			folderOwner=$(ls -l -g $usrFolder | grep "$u" | cut -d " " -f 3)
			echo " * $u's folder: $usrFolder"
			echo " * $usrFolder's owner: $folderOwner "
			echo " "
		else
			let deskUsers=$deskUsers+1
			echo ">> This is a desktop user"
			echo " "
			#Check personal folder
			usrFolder=$(cat /etc/passwd | grep "^$u:" | cut -d ":" -f 6)
			#Get Folder's owner
			folderOwner=$(ls -l -g /home | grep "$u" | cut -d " " -f 3)
			echo " * $u's folder: $usrFolder"
			echo " * $usrFolder's owner: $folderOwner"
			echo " "
		fi
	fi
done

#Get percentage

percDivision=$(echo "scale=2; $procUsers/$totalUsers" | bc -l)
usrPercentage=$(echo "scale=2; $percDivision*100" | bc -l)

#Overall things

echo " * Processed Users: $procUsers "
echo " * System Users: $sysUsers "
echo " * Desktop Users: $deskUsers "
echo " * Total Users: $totalUsers"
echo " "
echo " * Currently processing the $usrPercentage % of users"
