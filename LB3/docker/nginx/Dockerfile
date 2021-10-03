FROM nginx:alpine

RUN apt install mysql-server -y
RUN 

COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
