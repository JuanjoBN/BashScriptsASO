#!/bin/bash
num=1
muestra_linea(){
	
	echo "para el fichero $1 :"
	while read LINE
	do
		if [[  num%2 -eq 1 ]]
		then
			echo "$num : $LINE"
		fi
			
		((num++))
	done < $1

}	

while [[ $# -gt 0 ]]
do	

	if [[ $1 != [1-2] ]] && [[ ! -f $1 ]]
	then
		echo "Argumento invalido " >&2
		exit 1
	fi 

	if [[ ! $1 ]]
	then
		echo "El fichero $1 no existe o no es accesible" >&2
		exit 1
	fi
	
	if [[ $1 = [1-2] ]]
	then
		num=$1
	else
		muestra_linea "$1"
	fi
	shift
done








