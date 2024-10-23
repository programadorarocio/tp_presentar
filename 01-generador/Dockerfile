FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y ffmpeg
RUN apt-get install -y imagemagick

ADD ["./generador.sh", "/opt/generador.sh"]
ADD ["./cron-generador", "/etc/cron.d/cron-generador"]	

RUN crontab /etc/cron.d/cron-generador

ENTRYPOINT ["cron", "-f"]
