FROM alpine:latest

ENV BEATS_VERSION=6.0.0-rc1

COPY module /tmp/module
COPY filebeat.template.json /tmp/

RUN apk --update --no-cache --virtual build-dependencies add curl && \
    curl -s -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    mkdir filebeat && \
    tar xzvf filebeat-$BEATS_VERSION-linux-x86_64.tar.gz -C filebeat --strip-components 1 && \
    ln -s /filebeat/filebeat /usr/local/bin/filebeat && \
    rm -f filebeat-$BEATS_VERSION-linux-x86_64.tar.gz && \
    cp -rf /tmp/* /filebeat/ && \
    rm -rf /tmp/* && \
    apk del build-dependencies

WORKDIR filebeat

CMD ["filebeat", "-e", "-c", "/filebeat/filebeat.yml"]
