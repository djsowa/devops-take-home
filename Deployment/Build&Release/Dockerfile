FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y curl

COPY ./app /app

RUN chmod +x /app/Release.sh
RUN chmod +x /app/binaries/rancher

RUN echo $RANCHER_URL

ENTRYPOINT ["/bin/bash", "/app/Release.sh"]