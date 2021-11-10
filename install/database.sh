#!/bin/bash

if [[ ! "$ENABLE_INSTALL_MYCLI" == "true" ]]; then
    echo ''
    echo 'Install mycli'
    echo '-------------'
    brew install mycli
fi

if [[ ! "$ENABLE_INSTALL_SEQUELPRO" == "true" ]]; then
    echo ''
    echo 'Install sequel-pro'
    echo '------------------'
    brew install sequel-pro
fi

if [[ ! "$ENABLE_INSTALL_SQLITE" == "true" ]]; then
    echo ''
    echo 'Install sqlite'
    echo '--------------'
    brew install sqlite
fi

if [[ ! "$ENABLE_INSTALL_TABLEPLUS" == "true" ]]; then
    echo ''
    echo 'Install tableplus'
    echo '--------------'
    brew install tableplus
fi