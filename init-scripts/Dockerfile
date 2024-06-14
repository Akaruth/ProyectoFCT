FROM mysql:5.7

COPY . /docker-entrypoint-initdb.d

ENV MYSQL_ROOT_PASSWORD=adminCris
ENV MYSQL_DATABASE=baseUsuarios
ENV MYSQL_USER=adminCris
ENV MYSQL_PASSWORD=adminCris
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

EXPOSE 3306

RUN chmod -R 777 /docker-entrypoint-initdb.d
