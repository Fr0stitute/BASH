#!/bin/bash

function comprimir {
echo "Introduzca el nombre del fichero"
read fichero
echo "Introduzca la ruta de los archivos a comprimir"
read ruta
tar cvzf $fichero.tar.gz $ruta
}

function descomprimir {
echo "Introduzca el nombre del fichero"
read fichero
echo "Introduzca la ruta de los ficheros a descomprimir"
read ruta
cd $ruta
tar xvzf $nombre.tar.gz
}

clear
echo "1.COMPRIMIR CARPETA"
echo "2.DESCOMPRIMIR ARCHIVO"
read opc
case $opc in
1)
    comprimir;;
2)
    descomprimir;;
esac
