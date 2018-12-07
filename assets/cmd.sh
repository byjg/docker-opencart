#!/usr/bin/env bash

HTML_DIR=/var/www/html
OPT_DIR=/opt

rsync -a -v ${OPT_DIR}/admin_controller_extension/*    ${HTML_DIR}/admin/controller/extension
rsync -a -v ${OPT_DIR}/admin_language/*                ${HTML_DIR}/admin/language
rsync -a -v ${OPT_DIR}/admin_model_extension/*         ${HTML_DIR}/admin/model/extension
rsync -a -v ${OPT_DIR}/admin_view_image/*              ${HTML_DIR}/admin/view/image
rsync -a -v ${OPT_DIR}/admin_view_javascript/*         ${HTML_DIR}/admin/view/javascript
rsync -a -v ${OPT_DIR}/admin_view_stylesheet/*         ${HTML_DIR}/admin/view/stylesheet
rsync -a -v ${OPT_DIR}/admin_view_template_extension/* ${HTML_DIR}/admin/view/template/extension
rsync -a -v ${OPT_DIR}/catalog_controller_extension/*  ${HTML_DIR}/catalog/controller/extension
rsync -a -v ${OPT_DIR}/catalog_language/*              ${HTML_DIR}/catalog/language
rsync -a -v ${OPT_DIR}/catalog_model_extension/*       ${HTML_DIR}/catalog/model/extension
rsync -a -v ${OPT_DIR}/catalog_view_javascript/*       ${HTML_DIR}/catalog/view/javascript
rsync -a -v ${OPT_DIR}/catalog_view_theme/*            ${HTML_DIR}/catalog/view/theme
rsync -a -v ${OPT_DIR}/system_config/*                 ${HTML_DIR}/system/config
rsync -a -v ${OPT_DIR}/system_library/*                ${HTML_DIR}/system/library
rsync -a -v ${OPT_DIR}/image_catalog/*                 ${HTML_DIR}/image/catalog


touch /data/config.php
touch /data/admin-config.php

chown nobody:nobody -R /data
chown nobody:nobody -R /var/www/html

/usr/bin/supervisord  -n  -c /etc/supervisord.conf
