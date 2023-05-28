## Set our base image ##
FROM php:8-cli

## Install Packages and Extensions and Cleanup ##
RUN apt-get update && apt-get install -y --no-install-recommends wget curl dpkg-dev nano vim git unzip zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

## User Permissions ##
ARG user_id=1000
ARG group_id=1000
RUN usermod -u $user_id www-data && groupmod -g $group_id www-data

## Working Directory ##
WORKDIR /var/www/laravel

## Run our worker ##
CMD ["php", "/var/www/laravel/artisan", "schedule:work"]
