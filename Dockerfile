FROM php:5.6-cli

MAINTAINER BibCNRS <bibcnrs@inist.fr>

RUN apt-get update \
  && apt-get -y install php5 curl lib32z1  \
  && apt-get clean

WORKDIR /usr/local/ezproxy

RUN curl -sS -k https://www.oclc.org/content/dam/support/ezproxy/documentation/download/binaries/6-1-10/ezproxy-linux.bin > ./ezproxy \
    && chmod 755 ./ezproxy

COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 2048

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/ezproxy/ezproxy"]
