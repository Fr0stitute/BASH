#!/bin/bash
# grabsysinfo.sh - A simple menu driven shell script to to get information about your 
# Linux server / desktop.
# Author: Vivek Gite
# Date: 12/Sep/2007
#Traducción: Eddy Moreno
#Fecha: 28/Ago/2017
# Define variables
LSB=/usr/bin/lsb_release

# Purpose: Display pause prompt
# $1-> Message (optional)
function pause(){
	local message="$@"
	[ -z $message ] && message="Presione [Enter] para continuar..."
	read -p "$message" readEnterKey
}

# Purpose  - Display a menu on screen
function show_menu(){
    date
    echo "---------------------------"
    echo "   Menu Principal"
    echo "---------------------------"
	echo "1. Información del sistema operativo"
	echo "2. Información del hostname y DNS"
	echo "3. Información de red"
	echo "4. ¿Quién esta en línea?"
	echo "5. Últimos inicios de sesión"
	echo "6. Información de memoria utilizada y liberada"
	echo "7. Salir"
}

# Purpose - Display header message
# $1 - message
function write_header(){
	local h="$@"
	echo "---------------------------------------------------------------"
	echo "     ${h}"
	echo "---------------------------------------------------------------"
}

# Purpose - Get info about your operating system
function os_info(){
	write_header " Información del sistema "
	echo "Sistema Operativo : $(uname)"
	[ -x $LSB ] && $LSB -a || echo "$LSB command is not insalled (set \$LSB variable)"
	#pause "Presiona [Enter] para continuar..."
	pause
}

# Purpose - Get info about host such as dns, IP, and hostname
function host_info(){
	local dnsips=$(sed -e '/^$/d' /etc/resolv.conf | awk '{if (tolower($1)=="nameserver") print $2}')
	write_header " Información del hostname y DNS "
	echo "Hostname : $(hostname -s)"
	echo "Dominio DNS : $(hostname -d)"
	echo "Nombre de Dominio completo : $(hostname -f)"
	echo "Dirección de red (IP) :  $(hostname -i)"
	echo "Nombre del servidor DNS (DNS IP) : ${dnsips}"
	pause
}

# Purpose - Network inferface and routing info
function net_info(){
	devices=$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo")
	write_header " Información de red "
	echo "Total de interfaces de red encontradas : $(wc -w <<<${devices})"

	echo "*** Información de direcciones IP ***"
	ip -4 address show

	echo "***********************"
	echo "*** Direccionamiento de red ***"
	echo "***********************"
	netstat -nr

	echo "**************************************"
	echo "*** Información de tráfico de la interfaz ***"
	echo "**************************************"
	netstat -i

	pause 
}

# Purpose - Display a list of users currently logged on 
#           display a list of receltly loggged in users   
function user_info(){
	local cmd="$1"
	case "$cmd" in 
		who) write_header " ¿Quién esta en línea? "; who -H; pause ;;
		last) write_header " Lista de últimos inicios de sesión "; last ; pause ;;
	esac 
}

# Purpose - Display used and free memory info
function mem_info(){
	write_header " Memoria utilizada y liberada "
	free -m
    
    echo "*********************************"
	echo "*** Estadísticas de la memoria virtual ***"
    echo "*********************************"
	vmstat
    echo "***********************************"
	echo "*** Los 5 procesos que mas consumen recursos ***"
    echo "***********************************"	
	ps auxf | sort -nr -k 4 | head -5	
	pause
}
# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
	local c
	read -p "Ingrese su opción  [ 1 - 7 ] " c
	case $c in
		1)	os_info ;;
		2)	host_info ;;
		3)	net_info ;;
		4)	user_info "who" ;;
		5)	user_info "last" ;;
		6)	mem_info ;;
		7)	echo "Bye!"; exit 0 ;;
		*)	
			echo "Por favor seleccione una opción entre el 1 y el 7."
			pause
	esac
}

# ignore CTRL+C, CTRL+Z and quit singles using the trap
trap '' SIGINT SIGQUIT SIGTSTP

# main logic
while true
do
	clear
 	show_menu	# display memu
 	read_input  # wait for user input
done
