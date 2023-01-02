#!/bin/bash

if [[ "$ENABLE_INSTALL_BARTENDER" == "true" ]]; then
    echo ''
    echo 'Install bartender'
    echo '-----------------'
    brew install bartender
fi

if [[ "$ENABLE_INSTALL_BITWARDEN" == "true" ]]; then
    echo ''
    echo 'Install Bitwarden'
    echo '-----------------'
    brew install bitwarden
fi

if [[ "$ENABLE_INSTALL_CHEATSHEET" == "true" ]]; then
    echo ''
    echo 'Install cheatsheet'
    echo '------------------'
    brew install --cask cheatsheet
fi

if [[ "$ENABLE_INSTALL_DROPBOX" == "true" ]]; then
    echo ''
    echo 'Install Dropbox'
    echo '----------------'
    brew install --cask dropbox
fi

if [[ "$ENABLE_INSTALL_EVERNOTE" == "true" ]]; then
    echo ''
    echo 'Install evernote'
    echo '----------------'
    brew install evernote
fi

if [[ "$ENABLE_INSTALL_HOT" == "true" ]]; then
    echo ''
    echo 'Install hot'
    echo '-----------'
    brew install hot
fi

if [[ "$ENABLE_INSTALL_INSOMNIA" == "true" ]]; then
    echo ''
    echo 'Install insomnia'
    echo '----------------'
    brew install insomnia
fi

if [[ "$ENABLE_INSTALL_KEYCASTR" == "true" ]]; then
    echo ''
    echo 'Install keycastr'
    echo '----------------'
    brew install --cask keycastr
fi

if [[ "$ENABLE_INSTALL_NFOV" == "true" ]]; then
    echo ''
    echo 'Install nfov'
    echo '------------'
    brew install --cask nfov
fi

if [[ "$ENABLE_INSTALL_RAYCAST" == "true" ]]; then
    echo ''
    echo 'Install raycast'
    echo '---------------'
    brew install --cask raycast
fi

if [[ "$ENABLE_INSTALL_RECTANGLE" == "true" ]]; then
    echo ''
    echo 'Install rectangle'
    echo '-----------------'
    brew install rectangle
fi

if [[ "$ENABLE_INSTALL_UBERSICHT" == "true" ]]; then
    echo ''
    echo 'Install ubersicht'
    echo '------------------'
    brew install ubersicht
    rm -rf "$HOME/Library/Application Support/Übersicht/widgets"
    git clone https://github.com/etenzy/uebersicht-widgets.git "$HOME/Library/Application Support/Übersicht/widgets"
fi

if [[ "$ENABLE_INSTALL_VERACRYPT" == "true" ]]; then
    echo ''
    echo 'Install veracrypt'
    echo '-----------------'
    brew install veracrypt
fi

if [[ "$ENABLE_INSTALL_VISCOSITY" == "true" ]]; then
    echo ''
    echo 'Install viscosity'
    echo '-----------------'
    brew install viscosity
fi
