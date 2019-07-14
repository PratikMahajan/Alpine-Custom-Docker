FROM alpine:latest

RUN apk update && apk add bash

COPY install /install
RUN chmod 777 -R /install

RUN ["./install/commandline.sh"]

ENTRYPOINT /bin/sh
