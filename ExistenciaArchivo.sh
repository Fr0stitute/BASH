#!/bin/bash
if [ -f $0 ]
then
    echo "Introduzca un argumento"
fi

if [ -f $1 ]
then
    echo "$1 existe en la ruta especificada"
else
    echo "Lo siento, $1 no existe en la ruta especificada"
fi