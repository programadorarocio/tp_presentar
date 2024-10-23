#!/bin/bash

# Crear directorio de salida
mkdir -p /app/outputs/

# Generar número aleatorio
GENERADOR_RANDOM=$((RANDOM % 3))

echo $GENERADOR_RANDOM

# Ejecutar comando dependiendo del número generado
case $GENERADOR_RANDOM in
    0)
        # Genera un archivo aleatorio con base64
        base64 /dev/urandom | head -c 500 > file.txt
        ;;
    1)
        # Genera ruido de audio con ffmpeg
        ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" file.wav
        ;;
    2)
        # Genera una imagen con ruido aleatorio con ImageMagick
        convert -size 100x100 xc: +noise Random file.png
        ;;
esac

# Calcular hash MD5 del archivo generado
hash=$(md5sum ./file* | awk '{print $1}')

# Mover el archivo generado a la carpeta de salida con su hash como nombre
mv file* /app/outputs/$hash

echo "Generando archivos"
