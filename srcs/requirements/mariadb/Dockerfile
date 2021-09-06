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
    /etc/init.d/mariadb setup > /dev/null 2>&1 && \
    /etc/init.d/mariadb start > /dev/null 2>&1 && \
    \
    mysql -e "CREATE DATABASE $DATABASE; \
    GRANT ALL PRIVILEGES ON wordpress.* TO '$USER'@'%' IDENTIFIED BY '$PASSWORD'; \
    FLUSH PRIVILEGES;" && \
    \
    mysql $DATABASE < wordpress.sql && \
    \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASSWORD'; \
    FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mysqld_safe", "--skip-networking=off"]
