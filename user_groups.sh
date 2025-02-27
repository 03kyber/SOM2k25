#!/bin/bash

if [ $# -ne 1 ]; then
	echo "[ ERROR ] INVALID ARGUMENT(s). INPUT JUST ONE."
fi

user=$1

#Check if user exists in the system

echo "Looking for USER $1"
rc=0
cat /etc/passwd | grep -q $user || rc=1
if [ $rc -eq 0 ]; then
	echo "User found!"
else
	echo "[ ERROR ] Tu ordenador va a explotar en 3 segundos por que el usuario "$user" no existe!"
	exit 1
fi

cat /etc/group | grep -v $user
