#!/bin/bash

if [[ ! "$DISABLE_SUSPICIOUSPACKAGE" == "true" ]]; then
    echo ''
    echo 'Install Suspicious Package'
    echo '--------------------------'
    brew install suspicious-package
fi

if [[ ! "$DISABLE_WEBPQUICKLOOK" == "true" ]]; then
    echo ''
    echo 'Install WebPQuickLook'
    echo '---------------------'
    brew install WebPQuickLook
fi

if [[ ! "$DISABLE_QLCOLORCODE" == "true" ]]; then
    echo ''
    echo 'Install qlcolorcode'
    echo '-----------------------'
    brew install qlcolorcode
fi

if [[ ! "$DISABLE_QLMARKDOWN" == "true" ]]; then
    echo ''
    echo 'Install qlmarkdown'
    echo '------------------'
    brew install qlmarkdown
fi

if [[ ! "$DISABLE_QLPRETTYPATCH" == "true" ]]; then
    echo ''
    echo 'Install qlprettypatch'
    echo '---------------------'
    brew install qlprettypatch
fi

if [[ ! "$DISABLE_QLSTEPHEN" == "true" ]]; then
    echo ''
    echo 'Install qlstephen'
    echo '-----------------'
    brew install qlstephen
fi

if [[ ! "$DISABLE_QUICKNFO" == "true" ]]; then
    echo ''
    echo 'Install quicknfo'
    echo '----------------'
    brew install quicknfo
fi

if [[ ! "$DISABLE_QUICKLOOKCSV" == "true" ]]; then
    echo ''
    echo 'quicklook-csv'
    echo '-------------'
    brew install quicklook-csv
fi

if [[ ! "$DISABLE_QUICKLOOKJSON" == "true" ]]; then
    echo ''
    echo 'Install quicklook-json'
    echo '----------------------'
    brew install quicklook-json
fi

