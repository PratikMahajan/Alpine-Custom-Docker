FROM alpine:latest

RUN apk update && apk add bash

COPY install /install
RUN chmod 777 -R /install

RUN ["./install/commandline.sh"]
RUN ["./install/cloud.sh"]

USER cloud
ENTRYPOINT /bin/bash
