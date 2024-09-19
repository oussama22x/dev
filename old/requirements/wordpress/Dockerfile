
FROM debian:11

RUN mkdir -p /var/www/html

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    wget \
    unzip \
    && apt-get clean

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

RUN sed -i 's/listen = \/run\/php\/php-fpm.sock/listen = 9000/' /etc/php/*/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm", "-F"]
