#!/bin/bash

#Ejemplo de WHILE
tope=100
i=0

while [ $i -lt $tope ]
do
	echo $i
	i=$(($i+1))
done
