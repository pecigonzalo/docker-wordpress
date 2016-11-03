#!/bin/bash

if [[ ! -d /config/www/wordpress/index.php ]]; then
  wget -P /tmp/ https://wordpress.org/latest.zip
  unzip /tmp/latest.zip -d /config/www/
  rm -fr /tmp/latest.zip
  cp /config/www/wordpress/wp-config-sample.php /config/www/wordpress/wp-config.php -f
  chown -R abc:abc /config/www/wordpress
fi
