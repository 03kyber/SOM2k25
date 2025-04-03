#!/bin/bash
pastPerms="none"
differentPerms="-1"
for i in $(ls /home); do
	perms=$(stat -c %A /home/$i)
	echo "* $perms"
	echo " "
	if [ "$perms" != "$pastPerms" ]; then
		pastPerms="$perms"
		let differentPerms=$differentPerms+1
	fi
done

echo "Hay $differentPerms permisos diferente(s). "
