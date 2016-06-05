FROM linuxserver/baseimage.nginx
MAINTAINER Gonzalo Peci <davyjones@linuxserver.io>
ENV APTLIST="hhvm php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-redis wget unzip"

# Install APTLIST
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main" && \
apt-get update -q && \
apt-get install $APTLIST -qy --no-install-recommends && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

## Install HVVM
RUN /usr/share/hhvm/install_fastcgi.sh && \
/usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60 && \

## Install Wordpress
wget -P /config/www/ https://wordpress.org/latest.zip && \
unzip /config/www/latest.zip -d /config/www/ && \
rm -fr /config/www/latest.zip && \
cp /config/www/wordpress/wp-config-sample.php /config/www/wordpress/wp-config.php


#Adding Custom files
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh


# Volumes and Ports
VOLUME /config
EXPOSE 80 443