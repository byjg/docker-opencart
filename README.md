# Opencart Docker Image

[![Opensource ByJG](https://img.shields.io/badge/opensource-byjg.com-brightgreen.svg)](http://opensource.byjg.com)
[![Build Status](https://travis-ci.org/byjg/docker-opencart.svg?branch=master)](https://travis-ci.org/byjg/docker-opencart)

Opencart docker image prepared for production environment with volume persistent

Features:
- Persist volume with images and setup;
- Two images - one for install and other for running in production

# Tags

- Run Production Environment: byjg/opencart:3.0.2.0, byjg/opencart:lastest
- Run Installer (First time): byjg/opencart:3.0.2.0-installer

# Preparing Network

Create a local directory to store your opencart data:

```bash
# Create a network
docker network create oc
```

# Running Opencart

After you setup the volume you can create the MySQL and the Opencart instance:

```bash
# Create a container mysql.
# Please do the necessary adjustments here
# More info: https://hub.docker.com/_/mysql
docker run -d --rm --name mysql \
     --network oc \
     -e MYSQL_ROOT_PASSWORD=password \
     -v $PWD/opencart/mysql:/var/lib/mysql \
     mysql:5.7

# Run the Opencart
docker run -d --rm --name opencart \
    --network oc \
    -p 80:80 \
    -v $PWD/opencart/storage:/data \
    -v $PWD/opencart/admin_controller_extension:/var/www/html/admin/controller/extension \
    -v $PWD/opencart/admin_language:/var/www/html/admin/language \
    -v $PWD/opencart/admin_model_extension:/var/www/html/admin/model/extension \
    -v $PWD/opencart/admin_view_image:/var/www/html/admin/view/image \
    -v $PWD/opencart/admin_view_javascript:/var/www/html/admin/view/javascript \
    -v $PWD/opencart/admin_view_stylesheet:/var/www/html/admin/view/stylesheet \
    -v $PWD/opencart/admin_view_template_extension:/var/www/html/admin/view/template/extension \
    -v $PWD/opencart/catalog_controller_extension:/var/www/html/catalog/controller/extension \
    -v $PWD/opencart/catalog_language:/var/www/html/catalog/language \
    -v $PWD/opencart/catalog_model_extension:/var/www/html/catalog/model/extension \
    -v $PWD/opencart/catalog_view_javascript:/var/www/html/catalog/view/javascript \
    -v $PWD/opencart/catalog_view_theme:/var/www/html/catalog/view/theme \
    -v $PWD/opencart/system_config:/var/www/html/system/config \
    -v $PWD/opencart/system_library:/var/www/html/system/library \
    -v $PWD/opencart/image_catalog:/var/www/html/image/catalog\
    byjg/opencart:3.0.2.0-installer
```

The first time you'll be in the installation process. The database name should be `mysql.oc`. Just to understand, 
the `mysql` is the name of the container and `oc` is the network. 

![Install](install_01.jpg)


After finish the install please access the admin area. You'll receive a "Important Security Notification". Please
choose "Automatically Move" to the directory "/data/" as you can see below:

![Install](install_02.jpg)

OK. 

Now you won't lose your data saved in the opencart even if you stop and remove the containers. 

# Running in Production

Once you finish the setup and your store is running successfully you can stop the opencart container and start a new container
from image `byjg/opencart:3.0.2.0` with the same parameters used above.


