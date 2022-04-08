#!/bin/bash
clear
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1
fi

echo -n "Indica un nom de directori del sistema: "
read directori

if [ -d $directori ] && [ ! -L $directori ]
then
	cp -r $directori /mnt/
	mv /mnt/$directori /mnt/$directori.$(date +"%Y%m%d%H%M")
	exit 0
else
	echo "El directori demanat no exsisteix"
	exit 1
fi
