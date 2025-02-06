#!/bin/bash
#This script and the .csv file should be on the same directory.
read -p "Type in a valid name: " name

if [ $(grep -i "$name" minidns.csv) ]; then

	echo "* Name FOUND"

	namedata=$(grep -i $name minidns.csv)
	ip=$(cut -d ";" -f 2 <<<"$namedata")
	if ping -c 1 $ip >/dev/null 2>&1; then

		echo "* Machine FOUND"
		ping $ip
	else
		echo "* The machine that you are currently trying to ping is offline."
	fi

else
	echo "[ERROR] Name NOT FOUND, are you sure $name is on minidns.csv?"
fi
