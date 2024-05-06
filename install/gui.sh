#!/bin/bash

if [[ "$ENABLE_INSTALL_ONEPASSWORD" == "true" ]]; then
    echo ''
    echo 'Install 1Password'
    echo '-----------------'
    brew install --cask 1password
fi

if [[ "$ENABLE_INSTALL_BARTENDER" == "true" ]]; then
    echo ''
    echo 'Install bartender'
    echo '-----------------'
    brew install --cask bartender
fi

if [[ "$ENABLE_INSTALL_BITWARDEN" == "true" ]]; then
    echo ''
    echo 'Install Bitwarden'
    echo '-----------------'
    brew install --cask bitwarden
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
    brew install --cask evernote
fi

if [[ "$ENABLE_INSTALL_HOT" == "true" ]]; then
    echo ''
    echo 'Install hot'
    echo '-----------'
    brew install --cask hot
fi

if [[ "$ENABLE_INSTALL_INSOMNIA" == "true" ]]; then
    echo ''
    echo 'Install insomnia'
    echo '----------------'
    brew install --cask insomnia
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
    brew install --cask rectangle
fi

if [[ "$ENABLE_INSTALL_UBERSICHT" == "true" ]]; then
    echo ''
    echo 'Install ubersicht'
    echo '------------------'
    brew install --cask ubersicht
    rm -rf "$HOME/Library/Application Support/Übersicht/widgets"
    git clone https://github.com/etenzy/uebersicht-widgets.git "$HOME/Library/Application Support/Übersicht/widgets"
fi

if [[ "$ENABLE_INSTALL_VERACRYPT" == "true" ]]; then
    echo ''
    echo 'Install veracrypt'
    echo '-----------------'
    brew install --cask veracrypt
fi

if [[ "$ENABLE_INSTALL_VISCOSITY" == "true" ]]; then
    echo ''
    echo 'Install viscosity'
    echo '-----------------'
    brew install --cask viscosity
fi
