FROM nginx:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install gnupg2 -y
RUN apt-get install apache2-utils -y


COPY ./src/frontend /usr/share/nginx/html

EXPOSE 80