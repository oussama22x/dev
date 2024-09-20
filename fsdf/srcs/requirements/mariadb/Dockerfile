FROM debian:11

RUN apt-get update && apt-get install -y mariadb-server

COPY ./server.cnf /etc/mysql/my.cnf

COPY ./sc.sh ./sc.sh

RUN chmod +x ./sc.sh

EXPOSE 3306

CMD ["./sc.sh"]