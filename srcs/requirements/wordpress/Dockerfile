FROM alpine:3.14

RUN apk add --no-cache \
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
    mv wordpress/ /var/wordpress

RUN cd /var/wordpress && \
    sed -e "s/database_name_here/wordpress/" \
        -e "s/username_here/gplaid/" \
        -e "s/password_here/iegah9Ah/" \
        wp-config-sample.php > wp-config.php

RUN cd /etc/php7/php-fpm.d && \
    sed -i "s/127.0.0.1/0.0.0.0/" \
    www.conf

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-F"]
