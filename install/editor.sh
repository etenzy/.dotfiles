#!/bin/bash

if [[ ! "$ENABLE_INSTALL_PHPSTORM" == "true" ]]; then
    echo ''
    echo 'Install PhpStorm'
    echo '----------------'
    brew install phpstorm
fi

if [[ ! "$ENABLE_INSTALL_TEXSTUDIO" == "true" ]]; then
    echo ''
    echo 'Install TexStudio'
    echo '-----------------'
    brew install --cask mactex
    brew install texstudio
fi

if [[ ! "$ENABLE_INSTALL_VSCODE" == "true" ]]; then
    echo ''
    echo 'Install visual-studio-code'
    echo '--------------------------'
    brew install visual-studio-code
fi
