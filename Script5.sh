#!/bin/bash
currentDate=$(date +%s)
oldestFolder="null"
newestFolder="null"
closest=-9999999999
oldest=0
for i in $(ls /home); do
	folderData=$(stat -c %W /home/$i)
	echo "$i : $folderData"
	let difference=$folderData-$currentDate

	if [ $difference -lt $oldest ]; then
		oldest=$difference
		oldestFolder=$i
	fi
done
echo " "
for i in $(ls /home); do
        folderData=$(stat -c %W /home/$i)
        let difference=$folderData-$currentDate
	if [ $difference -gt $closest ]; then
		closest=$difference
		newestFolder=$i
	fi
done
echo "$oldestFolder es la mas vieja"
echo "$newestFolder es la mas nueva"
