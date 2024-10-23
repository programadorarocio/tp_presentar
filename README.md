#tp_presentar
En este trabajo práctico se desarrollarán las siguientes funcionalidades:

    Generador de archivos: Podrá generar archivos de texto, imágenes y sonidos.
    Clasificador de archivos: Ordenará los archivos según su tipo.
    Monitor del sistema: Reportará variables del uso del sistema (espacio libre en disco, uso de RAM, uso de CPU, número de procesos corriendo en el sistema)
    Analizador de texto: Buscará patrones en archivos de texto, palíndromos, direcciones de email, etc.

A su vez, estas funcionalidades se dividirán en dos módulos:

    01-generador: Genera periódicamente archivos en los distintos formatos.
    02-usuario:
        Provee un menú para elegir entre las distintas funcionalidades interactivamente.
        Se encarga de clasificar los archivos que se encuentren en un directorio específico.
        Monitorea la información de sistema del container.
        Analiza los textos.
            


generador

$ cd 01-generador/
$ docker build -t modulo-generador .
$ docker run -it -v $(pwd)/outputs-gen:/app/outputs/ modulo-generador

usuario

$ cd 02-usuario/
$ docker build -t modulo-usuario .
$ docker run -it -v $(pwd)/../01-generador/outputs-gen/:/opt/files/ -v $(pwd)/outputs-user/:/opt/outputs/ -v $(pwd)/textos/:/opt/textos/ modulo-usuario
