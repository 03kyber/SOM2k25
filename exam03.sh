#!/bin/bash

list=$(dpkg --get-selections | awk {'print$1'})
mindeps="10"
echo "$var"
for i in $list; do

	if [[ $i == *"utils"* ]]; then

		rawdepends=$(apt-cache depends $i | grep -E "Depends")
		numdepends=$(echo "$rawdepends" | grep -E -c "utils")
		echo "$i"

		if [ $mindeps -gt $numdepends -a $numdepends -ne 0 ]; then
			mindeps="$numdepends"
			paquete="$i"
		fi

	fi
done

echo "menores dependencias $mindeps del paquete $paquete"
