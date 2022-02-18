#!/bin/bash

if [[ "$ENABLE_INSTALL_GO" == "true" ]]; then
    echo ''
    echo 'Install go'
    echo '----------'
    brew install go
fi