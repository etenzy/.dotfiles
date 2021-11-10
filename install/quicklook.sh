#!/bin/bash

if [[ "$ENABLE_INSTALL_SUSPICIOUSPACKAGE" == "true" ]]; then
    echo ''
    echo 'Install Suspicious Package'
    echo '--------------------------'
    brew install suspicious-package
fi

if [[ "$ENABLE_INSTALL_WEBPQUICKLOOK" == "true" ]]; then
    echo ''
    echo 'Install WebPQuickLook'
    echo '---------------------'
    brew install WebPQuickLook
fi

if [[ "$ENABLE_INSTALL_QLCOLORCODE" == "true" ]]; then
    echo ''
    echo 'Install qlcolorcode'
    echo '-----------------------'
    brew install qlcolorcode
fi

if [[ "$ENABLE_INSTALL_QLMARKDOWN" == "true" ]]; then
    echo ''
    echo 'Install qlmarkdown'
    echo '------------------'
    brew install qlmarkdown
fi

if [[ "$ENABLE_INSTALL_QLPRETTYPATCH" == "true" ]]; then
    echo ''
    echo 'Install qlprettypatch'
    echo '---------------------'
    brew install qlprettypatch
fi

if [[ "$ENABLE_INSTALL_QLSTEPHEN" == "true" ]]; then
    echo ''
    echo 'Install qlstephen'
    echo '-----------------'
    brew install qlstephen
fi

if [[ "$ENABLE_INSTALL_QUICKNFO" == "true" ]]; then
    echo ''
    echo 'Install quicknfo'
    echo '----------------'
    brew install quicknfo
fi

if [[ "$ENABLE_INSTALL_QUICKLOOKCSV" == "true" ]]; then
    echo ''
    echo 'quicklook-csv'
    echo '-------------'
    brew install quicklook-csv
fi

if [[ "$ENABLE_INSTALL_QUICKLOOKJSON" == "true" ]]; then
    echo ''
    echo 'Install quicklook-json'
    echo '----------------------'
    brew install quicklook-json
fi

