# Usamos Ubuntu como base
FROM ubuntu:latest

# Actualizamos los paquetes e instalamos dependencias
RUN apt-get update 
RUN apt-get install -y bash 
RUN apt-get install -y gzip
Run apt-get install -y file

WORKDIR /opt/

ADD ["./scripts/", "/opt/scripts/"]

# Dar permisos de ejecución a los scripts
RUN chmod +x /opt/scripts/menu.sh /opt/scripts/submenu.sh

ENTRYPOINT ["bash", "/opt/scripts/menu.sh"]


