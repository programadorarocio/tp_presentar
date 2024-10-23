#!/bin/bash


# Crear carpetas si no existen:

mkdir -p outputs
mkdir -p outputs/img
mkdir -p outputs/snd
mkdir -p outputs/txt

# Inicializar los tres contadores para los nombres de cada tipo de archivo:
CONT_TXT=1
CONT_IMG=1
CONT_SND=1

# Iterar entre todos los archivos de salida del generador (hasheados):
for i in files/*
do


TYPE=$(file $i | awk '{print $2}')
# Comprobar tipo de archivo y mover a cada una de las carpetas enumerando los nombres
if [ $TYPE == "ASCII" ]; then
mv $i outputs/txt/texto$CONT_TXT.txt
((CONT_TXT++))
elif [ $TYPE == "RIFF" ]; then
mv $i outputs/snd/sonido$CONT_SND.wav
((CONT_SND++))
elif [ $TYPE == "PNG" ]; then
mv $i outputs/img/imagen$CONT_IMG.png
((CONT_IMG++))
fi
done
