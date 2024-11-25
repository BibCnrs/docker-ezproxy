FROM debian:bullseye
RUN \
  apt-get update \
  && apt-get -y install --no-install-recommends
COPY ./docker-run.sh /
WORKDIR /usr/local/ezproxy
RUN chmod +x /docker-run.sh
RUN mkdir -p /usr/local/ezproxy/config
COPY ./ezproxy-linux-7.3.8.bin /usr/local/ezproxy/ezproxy
RUN chmod +x /usr/local/ezproxy/ezproxy
RUN \
  apt-get purge -y \
  wget \
  && apt-get clean autoclean autoremove -y \
  && rm -rf /var/lib/apt/lists/*
CMD ["/docker-run.sh"]