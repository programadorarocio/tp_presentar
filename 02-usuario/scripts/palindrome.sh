#!/bin/bash

# Verifica si se ha pasado exactamente un argumento al script
if [ $# -ne 1 ]; then
    echo "Ingrese el nombre del archivo de texto a evaluar"

    exit 1

fi

# Asigna el primer argumento pasado al script a la variable 'archivo'.
archivo=$1

# Busca palabras en el archivo que son palíndromos
palindrome=$(grep -oE '\b(\w|á|é|i|ó|ú)+\b' $archivo|iconv -f UTF-8 -t ASCII//TRANSLIT| tr -s "[:punct:]"""| tr "[:lower:]" "[:upper:]")
#echo $palindrome

# Para cada palabra encontrada, inicia un bucle
for word in $palindrome; do
	if [ "$word" == "$(echo $word | rev)" ]; then
		echo "$word es palindromo!!!"
        fi
    done



