#!/bin/bash

#Check and discard arguments

if [ $# -ne 3 ]; then
	echo " [ERROR] PLEASE PROVIDE JUST 3 ARGUMENTS "
	echo " EXAMPLE: 192.168.4.0 /23 129.168.5.100"
	exit 1
else

#Check if FIRST ARGUMENT is a valid IP
#Segment IP in 4 different numbers

echo "Provided Network IP: $1"

sp1=$(echo "$1"|cut -d "." -f 1)
sp2=$(echo "$1"|cut -d "." -f 2)
sp3=$(echo "$1"|cut -d "." -f 3)
sp4=$(echo "$1"|cut -d "." -f 4)

#Run through segments 1-3

for i in $sp1 $sp2 $sp3; do
	if [ $i -ge 0 -a $i -le 255 ]; then
		echo " * $i SEGMENT IS VALID "
	else
		echo " [ERROR] $i SEGMENT IS INVALID, WRONGFUL IP "
		#If invalid, exit returning error
		exit 1

	fi
done

#Run through segment 4

if [ $sp4 -ge 0 -a $sp4 -lt 254 ]; then
	echo "$sp4 SEGMENT IS VALID"
else
	echo "[ERROR] $sp4 SEGMENT IS INVALID, WRONGFUL IP"
	exit 1
fi


fi

#Check if net mask is valid
#Netmask being 0 must coincide with last ip number being 0
mask=$(echo "$2"|cut -d "/" -f 2)
echo "$mask" #Separates number from the slash (/)
ip=$1

while [ $mask -ne 0 ]; do

	echo "$ip"
	let "mask=mask-8"
	echo "$mask"
	ip=$(echo "$ip"|cut -d "." -f 1)
done
