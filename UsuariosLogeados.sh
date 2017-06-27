#!/bin/bash
function linea(){
 echo "                                        "
}
 
function usuario(){
echo "Tu nombre de usuario : $(echo USER)"
linea 
}

function fecha(){
echo "Hora y Fecha actual : $(date)"
linea 
}

function usuariosactivos(){
echo "Usuarios logeados :" 
who
linea
}

fecha
usuario
usuariosactivos
