#!/bin/bash

echo ''
echo 'Install mas'
echo '-----------'
brew install mas

if [[ ! "$DISABLE_BETTERSNAPTOOL" == "true" ]]; then
    echo ''
    echo 'Install BetterSnapTool'
    echo '----------------------'
    mas "BetterSnapTool", id: 417375580
fi

if [[ ! "$DISABLE_COPYCLIP" == "true" ]]; then
    echo ''
    echo 'Install CopyClip'
    echo '----------------'
    mas "CopyClip", id: 595191960
fi

if [[ ! "$DISABLE_DROPOVER" == "true" ]]; then
    echo ''
    echo 'Install Dropover'
    echo '----------------'
    mas "Dropover", id: 1355679052
fi

if [[ ! "$DISABLE_UNARCHIVER" == "true" ]]; then
    echo ''
    echo 'Install The Unarchiver'
    echo '----------------------'
    mas "The Unarchiver", id: 425424353
fi

if [[ ! "$DISABLE_TRELLO" == "true" ]]; then
    echo ''
    echo 'Install Trello'
    echo '--------------'
    mas "Trello", id: 1278508951
fi

if [[ ! "$DISABLE_WIREGUARD" == "true" ]]; then
    echo ''
    echo 'Install WireGuard'
    echo '-----------------'
    mas "WireGuard", id: 1451685025
fi

if [[ ! "$DISABLE_XCODE" == "true" ]]; then
    echo ''
    echo 'Install Xcode'
    echo '-------------'
    mas "Xcode", id: 497799835
fi