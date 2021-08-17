#!/bin/bash

if [[ ! "$DISABLE_MYCLI" == "true" ]]; then
    echo ''
    echo 'Install mycli'
    echo '-------------'
    brew install mycli
fi

if [[ ! "$DISABLE_SEQUELPRO" == "true" ]]; then
    echo ''
    echo 'Install sequel-pro'
    echo '------------------'
    brew install sequel-pro
fi

if [[ ! "$DISABLE_SQLITE" == "true" ]]; then
    echo ''
    echo 'Install sqlite'
    echo '--------------'
    brew install sqlite
fi

if [[ ! "$DISABLE_TABLEPLUS" == "true" ]]; then
    echo ''
    echo 'Install tableplus'
    echo '--------------'
    brew install tableplus
fi