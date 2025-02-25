#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_YAMLHIGHLIGHTER" == "true" ]]; then
    echo ''
    echo 'Install YAML Highlighter'
    echo '------------------------'
    brew install yh
fi

if [[ "$ENABLE_INSTALL_YAMLLINT" == "true" ]]; then
    echo ''
    echo 'Install yamllint'
    echo '----------------'
    brew install yamllint
    mkdir -p $HOME/.config/yamllint
    ln -nfs $HOME/.dotfiles/shell/config/yamllint/config $HOME/.config/yamllint/config
fi

if [[ "$ENABLE_INSTALL_YAMLFIX" == "true" ]]; then
    echo ''
    echo 'Install yamlfix'
    echo '----------------'
    brew install yamlfix
    echo 'export YAMLFIX_SEQUENCE_STYLE="keep_style"' >> $HOME/.homebrew-env/yamlfix
    source $HOME/.homebrew-env/yamlfix
fi