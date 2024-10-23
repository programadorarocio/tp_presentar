#!/bin/bash

# Verifica si se ha pasado exactamente un argumento al script.
if [ $# -ne 1 ]; then
    echo "Ingrese el nombre del archvo de texto a evaluar"
#echo "Uso: $0 echo <archivo_de_entrada>"
    exit 1
fi

# Asigna el primer argumento pasado al script a la variable archivo.
archivo=$1

# Utiliza grep para buscar direcciones de correo electrónico en el archivo:
# - -oE: Muestra solo las coincidencias y permite expresiones regulares extendidas.
# - La expresión regular busca patrones de direcciones de correo electrónico.
# - El resultado se ordena y se eliminan las duplicadas con 'sort -u'.
#direccion=$(grep -oE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zAz]' $archivo)
direccion=$(grep -oE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' $archivo|sort -u)

# Muestra las direcciones de correo electrónico encontradas
echo "Direcciones de correo electronico:"
echo "$direccion"


