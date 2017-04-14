#!/bin/bash

Destino=/Backups

if [[ $# -eq 1 ]] && [[ -d $1 ]]
then

	Destino=$1
fi

cd $Destino

copia=$(date "+copiaCompleta_%Y%m%d.tgz")

find /home -depth -exec tar rvf $copia {} \; 2>/dev/null

touch FicheroControl.Backups /Backups
