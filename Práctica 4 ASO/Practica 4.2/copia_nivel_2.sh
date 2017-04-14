#!/bin/bash

Destino=/Backups

if [[ $# -eq 1 ]] && [[ -d $1 ]]
then

	Destino=$1
fi

cd $Destino

copia=$(date "+copiaNivel2_%Y%m%d.tgz")

find /home -depth -newer FicheroControl2.Backups2 -exec tar rvf $copia {} \; 2>/dev/null




