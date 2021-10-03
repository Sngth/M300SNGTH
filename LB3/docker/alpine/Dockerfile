FROM alpine:latest
#RUN apk add --no-cache mysql-client
#ENTRYPOINT ["mysql"]
#RUN apk update && apk add \
#    curl \
#    git \
#    vim
RUN apk add nginx
RUN mkdir -p /run/nginx
RUN touch /run/nginx/nginx.pid
RUN adduser -D -g 'www' www
RUN mkdir /www 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www
RUN ["./usr/sbin/nginx"]