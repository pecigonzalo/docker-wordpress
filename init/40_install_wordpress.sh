#!/bin/bash

if [[ ! -d /config/www/wordpress ]]; then
  wget -P /config/www/ https://wordpress.org/latest.zip
  unzip /config/www/latest.zip -d /config/www/
  rm -fr /config/www/latest.zip
  cp /config/www/wordpress/wp-config-sample.php /config/www/wordpress/wp-config.php
  chown -R abc:abc /config/www/wordpress
fi

if [[ ! -d /config/nginx/fastcgi_params ]]; then
  cp /etc/nginx/fastcgi_params /config/nginx/fastcgi_params
  chown -R abc:abc /config/nginx/fastcgi_params
fi
