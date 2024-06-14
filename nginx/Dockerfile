FROM nginx:latest

COPY ./default.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html

COPY /www /var/www/html

RUN chmod -R 777 /var/www/html
