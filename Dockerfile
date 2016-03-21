FROM php:5.6-cli

MAINTAINER BibCNRS <bibcnrs@inist.fr>

RUN apt-get update \
  && apt-get -y install php5 curl lib32z1 dnsutils vim  \
  && apt-get clean

WORKDIR /usr/local/ezproxy

COPY ezproxy-5.4.1 ./ezproxy
RUN chmod 755 ./ezproxy
COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 50162
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
