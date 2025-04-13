#!/bin/bash

rm -rf /backup
mkdir /backup
cd /usbmarie
touch file.txt
cd /

if [ $(id -u) -ne 0 ]; then
	echo "Necesitas privilegios de superusuario"
	exit 1
fi

if [ $# -ne 1 ]; then
	echo "El argumento debe ser una ruta en /dev"
	exit 1
fi

if [ ! -e $1 ]; then
	echo "La ruta no es valida."
	exit 1
fi

mountPoint=$(mount | grep $1 | cut -d " " -f3)
echo " * El punto de montaje es: $mountPoint"

#make backup

mkdir -p /backup
cp -r $mountPoint/* /backup
echo " ! Backup guardado en /backup"
umount $1

#format and mount in /mnt/marie

mkfs.ext4 $1
mount $1 /mnt/marie
cp -r /backup/* /mnt/marie
echo " * Backup reestablecido"

#perms

sudo chown mariecurie:mariecurie /mnt/marie

