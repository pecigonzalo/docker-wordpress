FROM lsiobase/xenial
MAINTAINER Gonzalo Peci <davyjones@linuxserver.io>
ENV APTLIST="hhvm wget unzip"

# Install APTLIST
RUN apt-get update -q && \
apt-get install $APTLIST -qy --no-install-recommends && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
COPY root/ /

# Volumes and Ports
VOLUME /config/www/wordpress
EXPOSE 9000
