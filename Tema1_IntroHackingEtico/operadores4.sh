#!/bin/bash

fichero=$1
#Existe fichero?
echo "Existe este fichero: $fichero?"
test -e $fichero
echo $?

#Comprobamos si el fichero es regular
echo "Fichero es regular?"
test -f $fichero 
echo $?

#Existe directorio?
echo "Existe este directorio: $fichero?"
test -d $fichero
echo $?

 
