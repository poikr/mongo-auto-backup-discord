FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget
RUN wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-debian92-x86_64-100.3.1.deb && \
    apt install ./mongodb-database-tools-*.deb -y && \
    rm -f mongodb-database-tools-*.deb
RUN apt-get install -y curl

RUN chmod +x ./mongo.sh
CMD ["./mongo.sh"]