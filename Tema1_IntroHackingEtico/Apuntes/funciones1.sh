#!/bin/bash

#Importar funciones de otro script 
source ./funciones.sh

para=0
while [ $para -ne 1 ]
do 
	menuScript
	elije_opcion
done

