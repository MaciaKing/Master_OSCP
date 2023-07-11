#!/bin/bash

#Ejemplo de FOR
if [ $# -eq 1 ]
then 
	recurso=$1
	for i in $( ls $recurso )
	do
		echo $i
		echo $recurso/$i
	done
else
	echo "sin parametro"
fi
