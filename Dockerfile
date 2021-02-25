FROM openjdk:14-jdk-alpine

LABEL maintainer="dungeonswdragons@gmail.com"

RUN apk add openssh
RUN addgroup -S dwd && adduser -S dwd -G dwd

RUN mkdir -p /home/dwd/.ssh
RUN chmod 777 /home/dwd/.ssh
#Add id_rsa and known hosts files
COPY id_rsa /home/dwd/.ssh/id_rsa

COPY known_hosts /home/dwd/.ssh/known_hosts

USER dwd:dwd
VOLUME /tmp
EXPOSE 8888

ARG DEPENDENCY=build/deps
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","ru/somarov/config_service/ConfigServiceApplicationKt"]