#!/bin/bash

if [[ "$ENABLE_INSTALL_ALFRED" == "true" ]]; then
    echo ''
    echo 'Install alfred'
    echo '--------------'
    brew install --cask alfred
fi

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

if [[ "$ENABLE_INSTALL_MAESTRAL" == "true" ]]; then
    echo ''
    echo 'Install Maestral'
    echo '----------------'
    brew install --cask maestral
fi

if [[ "$ENABLE_INSTALL_NFOV" == "true" ]]; then
    echo ''
    echo 'Install nfov'
    echo '------------'
    brew install --cask nfov
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
