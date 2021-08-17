#!/bin/bash

if [[ ! "$DISABLE_ALFRED" == "true" ]]; then
    echo ''
    echo 'Install alfred'
    echo '--------------'
    brew install alfred
fi

if [[ ! "$DISABLE_BARTENDER" == "true" ]]; then
    echo ''
    echo 'Install bartender'
    echo '-----------------'
    brew install bartender
fi

if [[ ! "$DISABLE_BETTERTOUCHTOOL" == "true" ]]; then
    echo ''
    echo 'Install bettertouchtool'
    echo '-----------------------'
    brew install bettertouchtool
fi

if [[ ! "$DISABLE_BITWARDEN" == "true" ]]; then
    echo ''
    echo 'Install Bitwarden'
    echo '-----------------'
    brew install bitwarden
fi

if [[ ! "$DISABLE_CHEATSHEET" == "true" ]]; then
    echo ''
    echo 'Install cheatsheet'
    echo '------------------'
    brew install cheatsheet
fi

if [[ ! "$DISABLE_EVERNOTE" == "true" ]]; then
    echo ''
    echo 'Install evernote'
    echo '----------------'
    brew install evernote
fi

if [[ ! "$DISABLE_HOT" == "true" ]]; then
    echo ''
    echo 'Install hot'
    echo '-----------'
    brew install hot
fi

if [[ ! "$DISABLE_INSOMNIA" == "true" ]]; then
    echo ''
    echo 'Install insomnia'
    echo '----------------'
    brew install insomnia
fi

if [[ ! "$DISABLE_UBERSICHT" == "true" ]]; then
    echo ''
    echo 'Install ubersicht'
    echo '------------------'
    brew install ubersicht
    rm -rf "$HOME/Library/Application Support/Übersicht/widgets"
    git clone https://github.com/etenzy/uebersicht-widgets.git "$HOME/Library/Application Support/Übersicht/widgets"
fi

if [[ ! "$DISABLE_VERACRYPT" == "true" ]]; then
    echo ''
    echo 'Install veracrypt'
    echo '-----------------'
    brew install veracrypt
fi

if [[ ! "$DISABLE_VISCOSITY" == "true" ]]; then
    echo ''
    echo 'Install viscosity'
    echo '-----------------'
    brew install viscosity
fi