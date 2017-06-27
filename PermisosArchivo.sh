#!/bin/bash
echo "¿Que permisos desea aplicar al archivo? (Representación decimal)"
read cod
echo "¿En donde se encuentra el archivo?"
read ruta
chmod $cod $ruta


