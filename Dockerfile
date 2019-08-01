FROM arm32v7/openjdk:latest
MAINTAINER Solo Super

ENV BLYNK_SERVER_VERSION 0.41.8
EXPOSE 9443

RUN mkdir /blynk /data /config && touch /config/server.properties

RUN curl -fL https://github.com/blynkkk/blynk-server/releases/download/v${BLYNK_SERVER_VERSION}/server-${BLYNK_SERVER_VERSION}.jar > /blynk/server.jar

VOLUME ["/config", "/data/backup"]

WORKDIR /data

ENTRYPOINT ["java", "-jar", "/blynk/server.jar", "-dataFolder", "/data", "-serverConfig", "/config/server.properties"]

