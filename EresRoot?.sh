#!/bin/bash
usuario=`whoami`
if [ $usuario == 'root' ] 
then
echo "La sesión activa es perteneciente al superusuario"
else 
echo "La sesión activa es llamada" $usuario
fi 