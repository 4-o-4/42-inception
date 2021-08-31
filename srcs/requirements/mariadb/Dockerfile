FROM alpine:3.14

RUN apk update && \
    apk add --no-cache \
    mysql \
    mysql-client \
    openrc

COPY ./conf/wordpress.sql /

RUN openrc > /dev/null 2>&1 && \
    touch /run/openrc/softlevel && \
    sed -i "s/skip-networking/#skip-networking/" \
    /etc/my.cnf.d/mariadb-server.cnf && \
    service mariadb setup > /dev/null 2>&1 && \
    service mariadb start > /dev/null 2>&1 && \
    mysql -e "CREATE DATABASE wordpress; \
    GRANT ALL PRIVILEGES ON wordpress.* TO 'gplaid'@'%' IDENTIFIED BY 'iegah9Ah'; \
    FLUSH PRIVILEGES;" && \
    mysql wordpress < wordpress.sql

EXPOSE 3306

CMD ["mysqld_safe"]
