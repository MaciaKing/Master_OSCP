#!/bin/bash

#Verificamos que entre un parametro
if [ $# -ne 1 ]
then
	echo "Necesita un parametro $0 <arg 1>"
fi

filename=$1
#Verificamos que el fichero exista
if [ ! -e $filename ]
then 
	echo "El parametro $filename no es un archivo"
fi


while read linea
do
	instruccion=`echo $linea | cut -f1 -d':'`
	fichero_salida=`echo $linea | cut -f2 -d':'`   
	#res=$($instruccion)
	$instruccion > $fichero_salida
	#echo "$res"

done < $filename
