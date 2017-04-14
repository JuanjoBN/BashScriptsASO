#!/bin/bash

#Definimos la ruta por defecto que será a partir del directorio actual
RUTA="."

if [[ $# -gt 1 ]]
then
	echo "Numero de argumentos incorrectos" >&2
	exit 1
fi 


if [[ ! -d $1 ]] && [[ $# -ne 0 ]] 
then 
	echo "Ruta incorrecta" >&2
	exit 1
fi

if [[ $# -ne 0 ]]
then
	RUTA=$1
fi
#Buscamos recursivamente todos los ficheros con extensión .cpp
find $RUTA -type f -name "*.cpp" |
#Recorremos las rutas que nos da el find
while read RutaFichero
do
	# Ejemplo de: basename /root/Desck/hola.cpp .cpp ==> nombre=hola
	nombre=$(basename $RutaFichero .cpp )
	#Obtenemos el directorio en el cual esta el fichero con dirname y le concatenamos el nombre con la extension
	RutaDestino=$(dirname $RutaFichero)"/"$nombre".cc"
	#Renombramos el fichero
	mv $RutaFichero $RutaDestino
	echo "Ha sido modificado $RutaFichero a $RutaDestino"

done





