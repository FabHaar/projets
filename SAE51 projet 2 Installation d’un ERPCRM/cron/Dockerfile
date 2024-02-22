FROM ubuntu:22.04

#et aussi mysql car c'est ce qui nous interesse
RUN apt-get update && apt-get upgrade -y
RUN apt-get install mysql-client -y

RUN apt-get install cron -y

COPY cron/crontabs /crontabs

RUN crontab /crontabs

COPY cron/save_hebdo.sh /save_hebdo.sh

CMD ["cron", "-f"]
