#!/bin/bash

if [[ ! "$DISABLE_SVN_LATEST" == "true" ]]; then
    echo ''
    echo 'Install svn'
    echo '-----------'
    brew install svn
fi