#!/bin/bash

function reinicio() {
shutdown -r now
}

function horareinicio() {
echo "Ingrese hora"
read hora
echo "Ingrese minuto"
read minuto
shutdown -r "$hora:$minuto"
}

function horaapagado() {
echo "Ingrese hora"
read hora
echo "Ingrese minuto"
read minuto
shutdown "$hora:$minuto"
}

function cancelar() {
echo "Apagado cancelado"
shutdown -c
}

function asistentehorario() {
    clear   
echo Asistente de horario
echo
echo "*.Reinicio"
echo "*.Apagar"
echo "*.Cancelar apagado"
echo 
read op
case $op in
1)
horareinicio;;
2)
horaapagado;;
3)
cancelar;;
esac
}

function apagar() {
poweroff
}

clear
echo Asistente de apagado
echo
echo "*.Reinicio"
echo "*.Apagar"
echo "*.Horario"
echo 
read opcion
case $opcion in
1 )
    reinicio;;
2 )
    apagado;;
3 )
    asistentehorario;;
esac


