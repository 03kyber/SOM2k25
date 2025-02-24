#!/bin/bash

if [ -d $HOME/netplanexam/net-Sunday ]; then
	echo "exists"
else
	mkdir net-Sunday
fi

if [ -d $HOME/netplanexam/net-Monday ]; then
	echo "exists"
else
	mkdir net-Monday
fi

if [ -d $HOME/netplanexam/net-Tuesday ]; then
	echo "exists"
else
	mkdir net-Tuesday
fi

if [ -d $HOME/netplanexam/net-Wednesday ]; then
	echo "exists"
else
	mkdir net-Wednesday
fi

if [ -d $HOME/netplanexam/net-Thursday ]; then
	echo "exists"
else
	mkdir net-Thursday
fi

if [ -d $HOME/netplanexam/net-Friday ]; then
	echo "exists"
else
	mkdir net-Friday
fi

if [ -d $HOME/netplanexam/net-Saturday ]; then
	echo "exists"
else
	mkdir net-Saturday
fi

date=$(date +%Y%m%d%H%M)
day=$(date +%A)

if [ "$1" = "save" ]; then
	cd /etc/netplan
	sudo tar cvzf netplan-bak-$day-$date.tar.gz *yaml
	today=$(date +%w)
	if [ $today -eq 0 ]; then
		sudo mv netplan-bak-$day-$date.tar.gz $HOME/netplanexam/net-Sunday
	fi

	if [ $today -eq 1 ]; then
		sudo mv netplan-bak-$day-$date.tar.gz $HOME/netplanexam/net-Monday
	fi

	if [ $today -eq 2 ]; then
		sudo mv netplan-bak-$day-$date.tar.gz $HOME/netplanexam/net-Tuesday
	fi

	if [ $today -eq 3 ]; then
		sudo mv netplan-bak-$day-$date.tar.gz $HOME/netplanexam/net-Wednesday
	fi

	if [ $today -eq 4 ]; then
		sudo mv netplan-bak-$day-$date.tar.gz $HOME/netplan/net-Thursday
	fi

	if [ $today -eq 5 ]; then
		sudo mv netplan-bak-$day-$date.tar.gz $HOME/netplanexam/net-Friday
	fi

	if [ $today -eq 6 ]; then
		sudo mv netplan-bak-$day-$date.tar.gz $HOME/netplanexam/net-Saturday
	fi
else
	if [ "$1" = "test" ]; then

		ping -c 4 192.168.44.44
		ping -c 3 192.168.44.43
		ping -c 2 192.168.5.46
		ping -c 1 10.0.2.15

	else
		echo "[! ERROR !] Invalid argument"
		exit 1
	fi

fi

