FROM debian:jessie

MAINTAINER BibCNRS <bibcnrs@inist.fr>

RUN apt-get update \
  && apt-get -y install curl lib32z1  \
  && apt-get clean

RUN curl -sS -k https://www.oclc.org/content/dam/support/ezproxy/documentation/download/binaries/6-1-10/ezproxy-linux.bin > /usr/local/bin/ezproxy \
    && chmod 755 /usr/local/bin/ezproxy

ENTRYPOINT ["ezproxy"]
