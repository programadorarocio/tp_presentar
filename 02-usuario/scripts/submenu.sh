#!/bin/bash

echo "Elija el archivo a analizar"

ls textos

# Leer el nombre del archivo ingresado por el usuario
read TEXTO

# Verificar si el archivo ingresado es un archivo y no un directorio
if [ ! -f "textos/$TEXTO" ]; then
    echo "Error: '$TEXTO' no es un archivo válido o no existe."
    exit 1
fi

# Menú de opciones
select opcion in "Estadistica de Palabras" "Palindromos" "Emails" "Salir"
do
case "$opcion" in
   "Estadistica de Palabras")
      $(dirname $0)/statswords.sh textos/$TEXTO
      ;;
   "Palindromos")
      $(dirname $0)/palindrome.sh textos/$TEXTO
      ;;
   "Emails")
      $(dirname $0)/mailaddress.sh textos/$TEXTO
      ;;
   "Salir")
      echo "Salir de Menu"
      exit 0
      ;;
   *)
      echo "Opcion elejida: $opcion"
esac
done
