#!/bin/bash

if [[ ! "$DISABLE_PHPSTORM" == "true" ]]; then
    echo ''
    echo 'Install PhpStorm'
    echo '----------------'
    brew install phpstorm
fi

if [[ ! "$DISABLE_TEXSTUDIO" == "true" ]]; then
    echo ''
    echo 'Install TexStudio'
    echo '-----------------'
    brew install texstudio
fi

if [[ ! "$DISABLE_VSCODE" == "true" ]]; then
    echo ''
    echo 'Install visual-studio-code'
    echo '--------------------------'
    brew install visual-studio-code
fi