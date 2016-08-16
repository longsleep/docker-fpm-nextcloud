#!/bin/sh

set -e

chgrp www-data /srv/www/config /srv/www/data /srv/www/apps
chmod g+w /srv/www/config /srv/www/data /srv/www/apps
exec /usr/sbin/php-fpm7.0 --nodaemonize --fpm-config /etc/php/7.0/fpm/php-fpm.conf
