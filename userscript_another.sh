#!/bin/bash

# Define loop and changing variables

for user in guybrush lechuck; do
	data=$(cat /etc/passwd | grep -F $user)
	#Get login
	login=$(echo $data | cut -d ":" -f 1)
	name=$(echo $data | cut -d ":" -f 5 | cut -d " " -f 1)
	surname=$(echo $data | cut -d ":" -f 5 | cut -d " " -f 2 | cut -d "," -f 1)
	echo "* DATA OF USER: $user"
	echo $login
	echo $name
	echo $surname

done
