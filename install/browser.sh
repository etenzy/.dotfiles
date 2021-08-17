#!/bin/bash

if [[ ! "$DISABLE_FIREFOX" == "true" ]]; then
    echo ''
    echo 'Install Firefox'
    echo '--------------'
    brew install firefox
fi

if [[ ! "$DISABLE_CHROME" == "true" ]]; then
    echo ''
    echo 'Install Google Chrome'
    echo '--------------'
    brew install google-chrome
fi