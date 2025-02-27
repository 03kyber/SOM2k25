#!/bin/bash

# Define loop and changing variables

for user in guybrush lechuck; do

	#Get line that contains our user's data
	data=$(cat /etc/passwd | grep -F $user)
	#Get things
	login=$(echo $data | cut -d ":" -f 1)
	name=$(echo $data | cut -d ":" -f 5 | cut -d " " -f 1)
	surname=$(echo $data | cut -d ":" -f 5 | cut -d " " -f 2 | cut -d "," -f 1)
 	#Output things
	echo "* DATA OF USER: $user"
	echo $login
	echo $name
	echo $surname

done
