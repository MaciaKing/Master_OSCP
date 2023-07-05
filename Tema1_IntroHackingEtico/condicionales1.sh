#!/bin/bash

ran=$RANDOM
echo "Numero generado random: $ran"

echo -n "Introduce numero a ver si lo adivinas: "
read numero

#Comprovamos si lo ha acertado
if [ $ran -eq $numero ]
then
	echo "Lo has adivinado !!!!!!"
else 
	echo "Vuelve a intentarlo"
fi


