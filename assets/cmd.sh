#!/usr/bin/env bash

rsync -a -v /opt/image /var/www/html

touch /data/config.php
touch /data/admin-config.php

chown nobody:nobody -R /data
chown nobody:nobody -R /var/www/html/image

/usr/bin/supervisord  -n  -c /etc/supervisord.conf
