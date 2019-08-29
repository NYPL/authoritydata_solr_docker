FROM ubuntu:latest AS production
EXPOSE 8983
RUN apt-get update
RUN apt-get install -y default-jre

ENV JAVA_HOME /usr/lib/jvm/default-java

WORKDIR /solr
ADD . /solr/

CMD ["java", "-jar", "/solr/start.jar"]

FROM production AS development

# This will be brought in via docker-compose
run rm -rf /solr/*
