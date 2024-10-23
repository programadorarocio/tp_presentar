#! /bin/bash

# Verifica si se ha pasado exactamente un argumento al script
if [ $# -ne 1 ]; then
    echo "Ingrese el nombre del archvo de texto a evaluar"
#    echo "Uso: $0 <archivo_de_entrada>"
    exit 1

fi

# Asigna el primer argumento pasado al script a la variable "archivo"
archivo=$1

# Calcula la longitud máxima de las palabras en el archivo
long_maxima=$(cat $archivo |tr -s '[:space:]' '\n'|awk '{print length}'|sort -n | tail -n 1)

# Calcula la longitud mínima de las palabras en el archivo
long_minima=$(cat $archivo |tr -s '[:space:]' '\n'|awk '{print length}'|sort -n | head -n 1)

# Calcula el promedio de la longitud de las palabras en el archivo
promedio=$(awk '{total += length($0)} END { print total/NR}' $archivo)

# Calcula el promedio de la longitud de las palabras en el archivo
echo "Maxima longitud de la palabra:  $long_maxima"
echo "Minima longitud de la palabra:  $long_minima"
echo "Promedio: $promedio"
