#!/bin/bash

if [ $# -ne 1 ]; then
	echo " [ERROR] Invalid number of arguments. "
	exit 1
fi

rc=0
cat /etc/group | grep -q $1 || rc=1

if [ $rc -eq 1 ]; then
	echo " [ERROR] Group doesn't exist. "
	exit 1
fi

groupString=$(cat /etc/group | grep $1)
userList=$(echo $groupString | cut -d ":" -f 4 | tr "," " ")
userCount=$(echo $userList | wc -w)
echo " "
echo " GROUP STRING : $groupString "
echo " USER LIST : $userList "
echo " USER COUNT : $userCount "
echo " "
if [ $userCount -eq 0 ]; then
	echo " [X] no users in the group "
	exit 1
fi

for i in $userList; do
	homeFolder=$(cat /etc/passwd | grep $i | cut -d ":" -f 6)
	echo " $homeFolder "
done

echo " "
#para que no quede feo
