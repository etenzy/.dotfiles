#!/bin/bash

if [[ ! "$DISABLE_VIRTUALBOX" == "true" ]]; then
    echo ''
    echo 'Install Virtualbox'
    echo '------------------'
    brew install virtualbox
fi

if [[ ! "$DISABLE_VIRTUALBOXEXT" == "true" ]]; then
    echo ''
    echo 'Install Virtualbox Extensions'
    echo '-----------------------------'
    brew install virtualbox-extension-pack
fi

if [[ ! "$DISABLE_MYCLI" == "true" ]]; then
    echo ''
    echo 'Install mycli'
    echo '-------------'
    brew install mycli
fi