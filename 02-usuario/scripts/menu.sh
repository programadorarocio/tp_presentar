#!/bin/bash

# Bucle infinito que mostrará el menú hasta que el usuario decida salir.
while true; do

# Muestra un mensaje de bienvenida y opciones al usuario.
echo "Hola, soy el menu del TP. Que quiere hacer?"

# Define el prompt para seleccionar opciones en el menú.
PS3='Elija>'

# Muestra un menú con opciones para el usuario
select opcion in "Clasificar archivos" "Monitorear Sistema" "Analizar Textos" "Salir"
do

# Maneja la opción seleccionada por el usuario.
case "$opcion" in
    "Clasificar archivos")
        $(dirname $0)/clasificador_archivos.sh
        ;;
    "Monitorear Sistema")
        echo "Elijo Monitorear el Sistema"
	$(dirname $0)/monitor.sh
        ;;
    "Analizar Textos")
        echo "Analizar Texto"
	$(dirname $0)/submenu.sh
        ;;
    "Salir")
        echo "Salir"
        exit 0
        ;;
    *)
        echo "Opción elegida: $opcion"
        ;;
esac

break

done

done
