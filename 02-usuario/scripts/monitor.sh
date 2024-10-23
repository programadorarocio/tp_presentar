#!/bin/bash

# Define el directorio donde se guardarán los informes.
OUTPUT_DIR=outputs

# Crea el directorio de salida si no existe.
mkdir -p $OUTPUT_DIR

# Obtiene la fecha y hora actuales en un formato específico.
FECHA_Y_HORA=$(date +"%d_%m_%y:%H_%M_%S")

# Obtiene el uso de CPU sumando el porcentaje de tiempo de usuario y sistema.
USO_CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Obtiene el uso de RAM en megabytes.
USO_RAM=$(free -m | awk '/Mem:/ {print $3}')

# Cuenta el número de procesos en ejecución.
CANT_PROCESOS=$(ps aux | wc -l)

# Obtiene el espacio libre en disco para la partición raíz (/) y toma el valor de la segunda línea de la salida.
ESPACIO_LIBRE=$(df --output=avail -h / | sed -n '2p')

# Crear informe:
REPORTE="Uso de CPU: $USO_CPU%\nUso de RAM: $USO_RAM MB\nNúmero de procesos: $CANT_PROCESOS\nEspacio libre en disco: $ESPACIO_LIBRE"


# Guardar el reporte en un archivo de texto en el directorio de salida, nombrado con la fecha y hora actuales.
echo -e "$REPORTE" > "outputs/report_$FECHA_Y_HORA.txt"

# Mensaje informativo indicando la ubicación donde se guardó el informe.
echo "Informe guardado en outputs/report_$FECHA_Y_HORA.txt"
