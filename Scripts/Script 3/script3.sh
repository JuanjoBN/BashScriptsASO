#!/bin/bash

num=0
CADENA="/bin/bash"

numeroArchivos(){


num=$(find $ruta | wc -l) 

}

if [[ $# -eq 0 ]] || [[ $# -gt 1 ]]
then
	echo "Numero de argumentos incorrecto" >&2
	exit 1
fi

IFS=: 

while read user key uid gid desc ruta Bash 
do
	[[ $Bash != $CADENA ]] && continue

		numeroArchivos "$ruta"

		if [[ num -ge $1 ]]
			then
			echo "$user"
		fi
	

done < /etc/passwd


