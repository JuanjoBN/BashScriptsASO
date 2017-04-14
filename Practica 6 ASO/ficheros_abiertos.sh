#!/bin/bash
#Autores: Cristian QUevedo Suárez, Alejandro Herrera Déniz y Francisco Antonio Montiel González 
#Grupo: t3_44 10
#Los modos indican si se ha activado la opción -u o no
if [[ $# -eq 0 ]]
then
  mode=0
  ruta=$(find /proc -maxdepth 1 -name [0-9]* )
  echo -e Fichero"\t\t\t"Propetario"\t"nº procesos_Lectura"\t"nº procesos_Escritura
	
else
  if [[ $1 == "-u" ]];then
    mode=1
    echo -e Fichero"\t\t\t"Propetario"\t"nº procesos_Lectura"\t"nº procesos_Escritura
  else
    echo Esta no es una opción valida, ponga la opción -u
  fi
fi

#Bucle que sirve para pasar la lista de usuarios. En caso de que no tenga la opción -u 
while [[ $2 -ge 0 ]];do
	if [[ $mode -eq 1 ]];then
	   #Busca los procesos de un usuario
	   ruta=$(find /proc -maxdepth 1 -name [0-9]* -user $2  2>/dev/null ) 
	fi
	#Realizamos lo que nos pide el enunciado
	for proceso in $ruta;do
  	fichero=$(cut -d ' ' -f 2 $proceso/stat  2>/dev/null ) 
	UIDF=$(grep Uid $proceso/status 2>/dev/null | tr -s '\t' : | cut -d : -f 2 ) 
	usuario=$(grep :$UIDF:[0-9] /etc/passwd | cut -d: -f 1  2>/dev/null)
	flectura=$(find $proceso/fd -perm 300 -o -perm 700 2>/dev/null | wc -l  )
	fescritura=$(find $proceso/fd -perm 500 -o -perm 700 2>/dev/null | wc -l  ) 
	
	echo -e $fichero"\t\t\t"$usuario"\t\t"$flectura"\t\t\t"$fescritura  
	done

shift
#Si ya no hay más argumentos se termina de ejecutar el script
if [[ $2 == "" ]];then
	break;
fi

done
