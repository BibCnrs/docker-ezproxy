FROM php:8.3.11-cli

LABEL fr.BibCNRS.image.authors="bibcnrs@inist.fr"

RUN apt-get update \
  && apt-get -y install curl lib32z1 dnsutils vim  \
  && apt-get clean

RUN mkdir /usr/local/ezproxy
WORKDIR /usr/local/ezproxy

COPY ./ezproxy-linux.bin ./ezproxy
RUN chmod 755 ./ezproxy

COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 50162
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
