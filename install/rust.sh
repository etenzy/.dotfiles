#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_RUST" == "true" ]]; then
    echo ''
    echo 'Install rustup-init'
    echo '-------------------'
    brew install rustup-init
    rustup-init -y
fi