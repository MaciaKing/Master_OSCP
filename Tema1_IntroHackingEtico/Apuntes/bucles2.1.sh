#!/bin/bash

#Ejemplo de WHILE
#Comprobamos que le ha llegado un fichero	
if [ $# -ne 1 ]
then	
	echo "Falta un parametro $0 <arg1.txt>"
	exit
fi

#Comprobamos que el argumento sea un .txt
filename=$1
if [ ! -f $filename ]
then
	echo "No es un fichero $1"
fi

#Leemos el fichero
while read linia
do
	echo $linia
done < $filename

