#!/bin/bash

filedate=$(date +%Y%m%d%H%M)
echo "$filedate"
if [ -d /netplan-baks ]; then
	sudo rm -rf /netplan-baks
	sudo mkdir /netplan-baks
else
	sudo mkdir /netplan-baks
fi
cd /etc/netplan
sudo tar cvzf netplan-config.$filedate.tar.gz *.yaml
sudo mv netplan-config.$filedate.tar.gz /netplan-baks/
