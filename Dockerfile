FROM php:5.6-cli

MAINTAINER BibCNRS <bibcnrs@inist.fr>

RUN apt-get update \
  && apt-get -y install php5 curl lib32z1  \
  && apt-get clean

RUN curl -sS -k https://www.oclc.org/content/dam/support/ezproxy/documentation/download/binaries/6-1-10/ezproxy-linux.bin > /usr/local/bin/ezproxy \
    && chmod 755 /usr/local/bin/ezproxy

COPY docker-entrypoint.sh /entrypoint.sh
VOLUME ["/usr/local"]

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/ezproxy"]
