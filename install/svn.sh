#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_SVN_LATEST" == "true" ]]; then
    echo ''
    echo 'Install svn'
    echo '-----------'
    brew install svn
fi