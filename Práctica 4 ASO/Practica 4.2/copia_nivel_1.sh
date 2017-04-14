#!/bin/bash

Destino=/Backups

if [[ $# -eq 1 ]] && [[ -d $1 ]]
then

	Destino=$1
fi

cd $Destino

copia=$(date "+copiaNivel1_%Y%m%d.tgz")

find /home -depth -newer FicheroControl.Backups -exec tar rvf $copia {} \; 2>/dev/null

touch FicheroControl2.Backups2 /Bacukps









