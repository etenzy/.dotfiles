#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_NODE_LATEST" == "true" ]]; then
    echo ''
    echo 'Install node'
    echo '------------'
    brew install node
fi

if [[ "$ENABLE_INSTALL_NODE_TEN" == "true" ]]; then
    echo ''
    echo 'Install node 10'
    echo '---------------'
    brew install node@10
fi

if [[ "$ENABLE_INSTALL_YARN" == "true" ]]; then
    echo ''
    echo 'Install yarn'
    echo '------------'
    brew install yarn
    echo 'path=("$HOME/.yarn/bin" $path)' >> $HOME/.homebrew-env/yarn
    source $HOME/.homebrew-env/yarn
fi