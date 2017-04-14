# BashScriptsASO
Administración de Sistemas Operativos

En este repositorio se encuentra almacenado todo el trabajo realizado en la asignatura de Administración de Sistemas Operativos de la ULPGC.
Cada práctica tiene su correspondiente enunciado e informe donde se explica lo realizado.
A continuación se explican los enunciados de los scripts realizados:

1:Escribir un script para mostrar solamente las líneas impares de un archivo de texto que se pasa como argumento al script.
Añadidos: a) permitir mostrar líneas pares o impares según una opción; b) permitir un número de ficheros variable.

2:Escribir un Script que permita encontrar aquellos usuarios cuyos UID se encuentran comprendidos en un determinado rango. 
Los valores de dicho rango se pasan como argumento; el primer argumento debe ser el valor mínimo y el segundo argumento debe ser el valor máximo. 
Añadido: si se omiten los argumentos, el rango se tomará de los valores UID_MIN y UID_MAX que se encuentran definidos en el fichero /etc/login.defs 

3:Escribir un script para dado un número entero que se pasa como argumento, obtener la relación de usuarios del sistema que son propietarios de un número de archivos mayor o igual que ese número. 

4:Escribir un script que permita buscar todos los archivos con extensión “.cpp” y renombrarlos como “.cc”. 
La búsqueda se hará recursivamente a partir de una ruta inicial R, que vendrá dada como argumento al script. Si se omite el argumento, R será el directorio actual. 

5:Escribir un script que permita buscar todos los archivos con extensión “.doc” o “.docx” y normalizar sus nombres, de manera que todos sus caracteres sean letras minúsculas (incluyendo la extensión). 
Por ejemplo, el archivo “MiFichero.DOCX” debe pasar a ser “mifichero.docx”.La búsqueda se hará recursivamente desde una ruta inicial R, que vendrá dada como argumento al script. 
Si se omite el argumento, R será el directorio actual.Por cada normalización ejecutada, se añadirá una línea al final del archivo de registro /var/log/cambiosDoc, que tendrá la fecha y hora del cambio 
(en formato RFC 3339 con precisión de segundos, ver NOTA 1), un tabulador, la ruta original del fichero, otro tabulador y el nuevo nombre del fichero (sólo el nombre, sin el directorio). Por ejemplo:
2013-10-16 10:29:43+01:00 /home/pepe/MiFichero.Doc mifichero.doc.

6:Escribir un script que compruebe que los shells asignados a los usuarios del sistema (campo 7 del fichero /etc/passwd) aparecen en el fichero /etc/shells. 
Si el shell de algún usuario no aparece en ese fichero, el script debe escribir el nombre del shell en cuestión y debe continuar con la comprobación.
El resultado final del script debe ser una lista (probablemente con elementos repetidos) de todos los shells asignados a los usuarios y que no aparezcan en el fichero /etc/shells.
