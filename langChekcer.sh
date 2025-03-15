#!/bin/bash
#Written by yours truly
echo " "
echo " Welcome to this little language checker, for giving it a name. Expect head errors when directories are processed"
echo " "

if [ $# -lt 1 -o $# -gt 3 ]; then
	echo " [ ERROR ] You have to provide between 1 and 3 args "
else
	 for l in $@; do

		for f in $(ls /usr/bin); do

			rc=0
			head -q -n 1 /usr/bin/$f | grep -q -i $l || rc=1

			if [ $rc -eq 1 ]; then
				let noneCounter=$noneCounter+1
				let finalNoneCounter=$noneCounter
			else
				if [ $l = "$1" ]; then
					let firstCounter=$firstCounter+1
					let finalFirstCounter=$firstCounter
				fi

				if [ $l = "$2" ]; then
					let secondCounter=$secondCounter+1
					let finalSecondCounter=$secondCounter
				fi

				if [ $l = "$3" ]; then
					let thirdCounter=$thirdCounter+1
					let finalThirdCounter=$thirdCounter
				fi
			fi

		done
	done
fi
echo " "
echo " --Files matching with the args--"
echo " * $finalFirstCounter $1"
echo " * $finalSecondCounter $2"
echo " * $finalThirdCounter $3"
echo " --Files not matching with anything at all "
echo " $finalNoneCounter no mathces"
