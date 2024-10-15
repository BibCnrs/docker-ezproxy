FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-cli \
    sed \
    && apt-get clean

WORKDIR /usr/local/ezproxy

COPY ./ezproxy-linux-7.3.8.bin /usr/local/ezproxy/ezproxy
RUN chmod +x /usr/local/ezproxy/ezproxy

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
