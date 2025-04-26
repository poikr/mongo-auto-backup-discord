FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget curl
RUN apt-get autoremove -y
RUN wget https://downloads.mongodb.org/migrator/1.13.0/mongodb-relational-migrator_1.13.0-1_amd64.deb
RUN apt install ./mongodb-database-tools-*.deb -y
RUN rm -f mongodb-database-tools-*.deb

RUN chmod +x ./mongo.sh
CMD ["./mongo.sh"]