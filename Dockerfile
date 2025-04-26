FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget curl
RUN apt-get autoremove -y
RUN wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2004-arm64-100.12.0.deb
RUN dpkg -i mongodb-database-tools*.deb
RUN rm -f mongodb-database-tools*.deb

RUN chmod +x ./mongo.sh
CMD ["./mongo.sh"]