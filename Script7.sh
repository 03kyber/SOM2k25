#!/bin/bash

if [ $# -ne 1 ]; then
	echo "[ERROR] Invalid number of arguments"
	exit 1
fi
totalPerms=$(ls -l $HOME | wc -l)
permCount=0

for i in $(ls $HOME); do
	perms=$(stat -c %a $HOME/$i)
	echo $perms
	if [ $perms -eq $1 ]; then
		let permCount=$permCount+1
	fi

done
#acabar
PERMcentage=$(echo "$permCount/$totalPerms" | bc)
echo $PERMcentage
echo "Permisos totales $totalPerms"
echo "Permisos que coinciden $permCount"
