FROM alpine:latest

RUN apk update && apk add --no-cache mariadb

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld"]
