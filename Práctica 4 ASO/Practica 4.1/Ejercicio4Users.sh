#!/bin/bash

userdel -r powerUser 2>/dev/null

for (( i=0; i<=40; i++ ))
do
	userdel -r user$i 2>/dev/null

done
groupdel myusers	2>/dev/null


mkdir ~/Users 2>/dev/null

useradd powerUser -M
groupadd myusers 
gpasswd -A powerUser myusers

mkdir ~/Users/myusers 2>/dev/null
chgrp myusers ~/Users/myusers  
chmod g=wr ~/Users/myusers



for (( i=0; i<=40; i++ ))
do
	
	useradd user$i -g myusers -b ~/Users -m -k /etc/skel

	chage -d 2016-12-19 -m 15 -W 7 -I 7 user$i 


done



echo "Hecho"
