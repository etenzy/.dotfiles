#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_RUST" == "true" ]]; then
    echo ''
    echo 'Install rustup-init'
    echo '-------------------'
    brew install rustup-init
    rustup-init -y
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> $HOME/.homebrew-env/cargo
    echo 'fish_add_path $HOME/.cargo/bin' >> $HOME/.homebrew-env/cargo.fish
fi