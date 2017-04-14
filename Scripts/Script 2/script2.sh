#!/bin/bash

UID_MIN=$1
UID_MAX=$2


rangoUID (){

#Usamos el grep para coger la linea donde estan los UID y con el tr quitamos los espacios,letras y "_"
UID_MIN=$(grep UID_MIN /etc/login.defs | tr -d '[:blank:][:alpha:][:punct:]' ) 
UID_MAX=$(grep UID_MAX /etc/login.defs | tr -d '[:blank:][:alpha:][:punct:]' ) 

}



if [[ $# -eq 0 ]]
then
	
	rangoUID "$UID_MIN" "$UID_MAX" 
	
fi

#El identificador de campos
IFS=: 

#Comprobamos que los argumentos son numeros enteros y que hay dos
if [[ ! $UID_MIN =~ ^[-+]?[0-9]+$ ]] || [[ ! $UID_MAX =~ ^[-+]?[0-9]+$ ]] || [[ $# != 2 ]] && [[ $# -ne 0 ]]
then
	echo "Parametros incorrectos" >&2
	exit 1
fi


while read user key uid gid resto
do
	if [[ $UID_MIN -lt $uid ]] && [[ $UID_MAX -gt $uid ]]
	then
		echo $user

	fi
done < /etc/passwd


