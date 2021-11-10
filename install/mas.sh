#!/bin/bash

echo ''
echo 'Install mas'
echo '-----------'
brew install mas

if [[ ! "$ENABLE_INSTALL_DROPOVER" == "true" ]]; then
    echo ''
    echo 'Install Dropover'
    echo '----------------'
    mas install 1355679052
fi

if [[ ! "$ENABLE_INSTALL_UNARCHIVER" == "true" ]]; then
    echo ''
    echo 'Install The Unarchiver'
    echo '----------------------'
    mas install 425424353
fi

if [[ ! "$ENABLE_INSTALL_TRELLO" == "true" ]]; then
    echo ''
    echo 'Install Trello'
    echo '--------------'
    mas install 1278508951
fi

if [[ ! "$ENABLE_INSTALL_WIREGUARD" == "true" ]]; then
    echo ''
    echo 'Install WireGuard'
    echo '-----------------'
    mas install 1451685025
fi

if [[ ! "$ENABLE_INSTALL_XCODE" == "true" ]]; then
    echo ''
    echo 'Install Xcode'
    echo '-------------'
    mas install 497799835
fi
