#!/usr/bin/bash

# depends on "lnif" function (which depends on explicit $HOME paths); 
# see separate bash repo
source $BASH_CUSTOM_FUNCTIONS_FILE

CURRENT_DIR=$(pwd)

#···············································································
#   SETUP COMPOSER, HOMESTEAD AND PHP
#···············································································

PHP_BASE='/z/750/dot/repos/lang-php/config/workstation/arch'
NGX_BASE='/z/750/dot/repos/networking/configs/workstation/generic/nginx/linked_dir/server_vhosts/open/enabled'

lnif "$PHP_BASE/composer"                       '/home/rigel/.composer'
lnif "$PHP_BASE/laravel_homestead"              '/home/rigel/.homestead'
lnif "$PHP_BASE/php/linked_dir"                 '/etc/php'
lnif "$PHP_BASE/php/test/vhost/pinfo.nginx"     "$NGX_BASE/pinfo.nginx"

sudo cp -v "$PHP_BASE/php/test/index/pinfo.php" '/srv/http/pinfo.php'

sudo systemctl restart php-fpm

#···············································································
cd $CURRENT_DIR
