#!/bin/bash

# Define loop and changing variables

for user in guybrush lechuck; do

	#Get line that contains our user's data
	data=$(cat /etc/passwd | grep -F $user)
	groupdata=$(cat /etc/groups | grep -F $user)
	#Get things
	login=$(echo $data | cut -d ":" -f 1)
	name=$(echo $data | cut -d ":" -f 5 | cut -d " " -f 1)
	surname=$(echo $data | cut -d ":" -f 5 | cut -d " " -f 2 | cut -d "," -f 1)
	uid=$(echo $data | cut -d ":" -f 3)
	shell=$(echo $data | cut -d ":" -f 7)
	groupname=$(echo $data | cut -d ":" -f 1)
 	#Output things
	echo "* DATA OF USER: $user"
	echo "LOGIN: $login"
	echo "NAME: $name"
	echo "SURNAME: $surname"
	echo "USER ID: $uid"
	echo "SHELL: $shell"
	echo "GROUPS: $groupname"

done
