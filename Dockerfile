FROM alpine:latest

RUN apk update && apk add bash

COPY installer.sh /installer.sh
RUN chmod 777 /installer.sh

RUN ["./installer.sh"]
