#!/bin/bash

#while true; do



#done

on=$(ip link show | grep "state UP")
off=$(ip link show | grep "state DOWN")

#echo "$on"
#echo "$off"

if [ echo ip link show | grep "state UP" ]; then

	echo "si"
fi
