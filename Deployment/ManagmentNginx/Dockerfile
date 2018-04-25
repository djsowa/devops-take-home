FROM nginx:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install gnupg2 -y
RUN apt-get install apache2-utils -y

COPY ./app/default.conf /etc/nginx/conf.d/default.conf

RUN htpasswd -b -c /etc/nginx/.htpasswd eco-vadis ecoV0984ruck34uv