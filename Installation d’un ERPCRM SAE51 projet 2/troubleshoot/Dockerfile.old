FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mysql-client -y

RUN apt-get install cron -y

#RUN echo "* * * * 7 mysqldump -u cron -p'cron' -h 127.0.0.1 --port=3306 dolibarr > /var/www/documents/save.sql 2> /dev/null" >> /etc/cron.d/crontab
#pour pousser plus tard, on pourra mettre un script à executer qui vérifie save.sql et qui en créer d'autres

RUN echo "2 * * * * mysqldump -u cron -p'cron' -h SQL_Server --port=3306 dolibarr > /var/www/documents/save.sql" >> /etc/crontab

CMD ["cron", "-f"]
