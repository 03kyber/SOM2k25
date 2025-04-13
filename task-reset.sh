#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo " * Necesitas permisos !!!"
	exit 1
fi

umount /dev/sdb1
mkfs.vfat /dev/sdb1
mount /dev/sdb1 /usbmarie

rm -rf /mnt/marie/*
