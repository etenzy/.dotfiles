#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_PHP_LATEST" == "true" ]]; then
    echo ''
    echo 'Install php'
    echo '-----------'
    brew install php
fi

if [[ "$ENABLE_INSTALL_PHP_COMPOSER" == "true" ]]; then
    echo ''
    echo 'Install composer'
    echo '----------------'
    brew install composer
    echo 'path=("$HOME/.composer/vendor/bin" $path)' >> $HOME/.homebrew-env/composer
    echo 'export COMPOSER_HOME="$HOME/.composer"' >> $HOME/.homebrew-env/composer
    echo 'export COMPOSER_MEMORY_LIMIT=-1' >> $HOME/.homebrew-env/composer
    echo 'fish_add_path $HOME/.composer/vendor/bin' >> $HOME/.homebrew-env/composer.fish
    echo 'set -gx COMPOSER_HOME $HOME/.composer' >> $HOME/.homebrew-env/composer.fish
    echo 'set -gx COMPOSER_MEMORY_LIMIT -1' >> $HOME/.homebrew-env/composer.fish
fi

if [[ "$ENABLE_INSTALL_PHP_IMAGEMAGICK" == "true" ]]; then
    echo ''
    echo 'Install imagemagick'
    echo '-------------------'
    brew install imagemagick

    echo ''
    echo 'Install imagick'
    echo '---------------'
    printf "\n" | pecl install imagick
fi

if [[ "$ENABLE_INSTALL_PHP_MEMCACHED" == "true" ]]; then
    echo ''
    echo 'Install memcached'
    echo '-----------------'
    printf "\n" | pecl install memcached
fi

if [[ "$ENABLE_INSTALL_PHP_XDEBUG" == "true" ]]; then
    echo ''
    echo 'Install xdebug'
    echo '--------------'
    printf "\n" | pecl install xdebug
fi

if [[ "$ENABLE_INSTALL_PHP_REDIS" == "true" ]]; then
    echo ''
    echo 'Install php-redis'
    echo '-------------'
    printf "\n" | pecl install redis
fi

if [[ "$ENABLE_INSTALL_PHP_LARAVEL" == "true" ]]; then
    echo ''
    echo 'Install laravel installer'
    echo '-------------------------'
    composer global require laravel/installer
fi

if [[ "$ENABLE_INSTALL_PHP_ENVOY" == "true" ]]; then
    echo ''
    echo 'Install laravel envoy'
    echo '---------------------'
    composer global require laravel/envoy
fi

if [[ "$ENABLE_INSTALL_PHP_EXPOSE" == "true" ]]; then
    echo ''
    echo 'Install beyondcode/expose'
    echo '-------------------------'
    composer global require beyondcode/expose
fi