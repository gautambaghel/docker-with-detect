FROM docker:stable

RUN apk update && apk add bash

# INSTALL JAVA 8
RUN apk --update --no-cache add curl ca-certificates tar && \
    apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk && \
    apk add glibc-2.30-r0.apk && \
    rm glibc-2.30-r0.apk

RUN apk --no-cache add openjdk8-jre

RUN wget https://detect.synopsys.com/detect.sh && \
    mkdir /opt/blackduck/ && \
    mv detect.sh /opt/blackduck/ && \
    chmod +x /opt/blackduck/detect.sh
