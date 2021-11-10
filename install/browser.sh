#!/bin/bash

if [[ "$ENABLE_INSTALL_FIREFOX" == "true" ]]; then
    echo ''
    echo 'Install Firefox'
    echo '--------------'
    brew install firefox
fi

if [[ "$ENABLE_INSTALL_CHROME" == "true" ]]; then
    echo ''
    echo 'Install Google Chrome'
    echo '--------------'
    brew install google-chrome
fi