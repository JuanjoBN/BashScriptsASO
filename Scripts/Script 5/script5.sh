#!/bin/bash


rutaDOC(){

	find $1 -type f -name "*.doc" -o -name "*.DOC" |
	while read RutaFichero 
	do

	
		nombre=$(basename $RutaFichero .doc | tr [:upper:] [:lower:] )
		nombreExtend=$nombre".doc"
		directorio=$(dirname $RutaFichero)
	
		
		RutaDestino=$directorio/$nombreExtend
	
		

		if [[ $RutaFichero != $RutaDestino ]]
		then
			mv $RutaFichero $RutaDestino
			echo -e $(date --rfc-333=seconds)"\t"$RutaFichero"\t"$nombre >> $2
		fi

		done


}

rutaDOCX(){

	find $1 -type f -name "*.docx" -o -name "*.DOCX" |
	while read RutaFichero 
	do

	
		nombre=$(basename $RutaFichero .docx | tr [:upper:] [:lower:] )
		nombreExtend=$nombre".docx"
		directorio=$(dirname $RutaFichero)
	
		
		RutaDestino=$directorio/$nombreExtend
	
		

		if [[ $RutaFichero != $RutaDestino ]]
		then
			mv $RutaFichero $RutaDestino
			echo -e $(date --rfc-333=seconds)"\t"$RutaFichero"\t"$nombre >> $2
		fi

		done


}




RUTA="."
FicheroDoc="/var/log/cambiosDoc"

if [[ $# -gt 1 ]]
then
	echo "Numero de argumentos incorrecto" >&2
	exit 1
fi

if [[ ! -d $1 ]] && [[ $# -ne 0 ]]
then
	echo " $1 no es un directorio" >&2
	exit 1
else
	RUTA=$1
fi

if [[ ! -f $FicheroDoc ]]
then
	touch "$FicheroDoc"
fi


rutaDOC "$RUTA" "$FicheroDoc"
rutaDOCX "$RUTA" "$FicheroDoc"



	



  









