#!/bin/bash

if [[ "$ENABLE_INSTALL_UTM" == "true" ]]; then
    echo ''
    echo 'Install UTM'
    echo '-----------'
    brew install --cask utm
fi

if [[ "$ENABLE_INSTALL_VIRTUALBOX" == "true" ]]; then
    echo ''
    echo 'Install Virtualbox'
    echo '------------------'
    brew install virtualbox
fi

if [[ "$ENABLE_INSTALL_VIRTUALBOXEXT" == "true" ]]; then
    echo ''
    echo 'Install Virtualbox Extensions'
    echo '-----------------------------'
    brew install virtualbox-extension-pack
fi

if [[ "$ENABLE_INSTALL_VAGRANT" == "true" ]]; then
    echo ''
    echo 'Install vagrant'
    echo '-------------'
    brew install vagrant
fi