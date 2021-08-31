FROM alpine:3.14

RUN apk update && \
    apk add --no-cache \
    php-curl \
    php-fpm \
    php-gd \
    php-json \
    php-mbstring \
    php-mysqli \
    php-zlib \
    wget

RUN wget --quiet https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz > /dev/null && \
    rm -rf latest.tar.gz && \
    mv wordpress/ /var/wordpress && \
    cd /var/wordpress && \
    sed -e "s/database_name_here/wordpress/" \
        -e "s/username_here/gplaid/" \
        -e "s/password_here/iegah9Ah/" \
        -e "s/localhost/mariadb/" \
        wp-config-sample.php > wp-config.php && \
    sed -i "s/127.0.0.1/0.0.0.0/" \
    /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm7", "--nodaemonize"]
