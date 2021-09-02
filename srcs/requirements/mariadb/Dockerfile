FROM alpine:3.14

ARG DATABASE
ARG USER
ARG PASSWORD

RUN apk update && \
    apk add --no-cache \
    mysql \
    mysql-client \
    openrc

COPY ./conf/wordpress.sql /

RUN openrc > /dev/null 2>&1 && \
    touch /run/openrc/softlevel && \
    \
    sed -i "s/skip-networking/#skip-networking/" \
    /etc/my.cnf.d/mariadb-server.cnf && \
    \
    service mariadb setup > /dev/null 2>&1 && \
    service mariadb start > /dev/null 2>&1 && \
    \
    mysql -e "CREATE DATABASE $DATABASE; \
    GRANT ALL PRIVILEGES ON $DATABASE.* TO '$USER'@'%' IDENTIFIED BY '$PASSWORD'; \
    FLUSH PRIVILEGES;" && \
    \
    mysql $DATABASE < wordpress.sql

EXPOSE 3306

CMD ["mysqld_safe"]
