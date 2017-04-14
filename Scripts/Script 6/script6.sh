#!/bin/bash




while read line
do		
	Bash=$(echo $line | cut -f7 -d: )
	count=0
	
	while read shell
	do	
		if [[ $Bash == $shell ]]
		then
			
			count=1
			break
		fi
	done </etc/shells

	if [[ $count -eq 0 ]]
	then
		echo "Éste shell del /etc/passwd: $Bash  no está en /etc/shells"
	fi
done < /etc/passwd




