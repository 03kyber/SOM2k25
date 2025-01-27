#!/bin/bash
aux1=0
aux2=0
espmsg=$(dpkg -L libreoffice-l10n-es | grep -c "MESSAGE")
echo " * $espmsg MESSAGE files on Spanish package"
engmsg=$(dpkg -L libreoffice-l10n-en-gb | grep -c "MESSAGE")
echo " * $engmsg MESSAGE files on English package"

echo "$espmsg, $engmsg"

if [ $espmsg -lt $engmsg ]; then
	echo "Spanish localization files have less MESSAGE files than the English one."
fi

if [ $espmsg -gt $engmsg ]; then
	echo "Spanish localization files have more MESSAGE files than the English one."
fi

if [ $espmsg -eq $engmsg ]; then
	echo "Spanish and English packages have the same amount of MESSAGE files"
fi



#for i in $espmsg; do
#	espusage=$(du $i)
#	let aux=espusage+aux
#done

#echo "$espusage"
