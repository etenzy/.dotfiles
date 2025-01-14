#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_GO" == "true" ]]; then
    echo ''
    echo 'Install go'
    echo '----------'
    brew install go
    echo 'path=("$HOME/go/bin" $path)' >> $HOME/.homebrew-env/go
fi