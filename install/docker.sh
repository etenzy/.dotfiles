#!/bin/bash

if [[ ! "$ENABLE_INSTALL_DOCKER_DESKTOP" == "true" ]]; then
    echo ''
    echo 'Install docker Desktop'
    echo '-----------'
    brew install homebrew/cask/docker
fi

if [[ ! "$ENABLE_INSTALL_CTOP" == "true" ]]; then
    echo ''
    echo 'Install ctop'
    echo '-----------'
    brew install ctop
fi

if [[ ! "$ENABLE_INSTALL_DOCKERCLEAN" == "true" ]]; then
    echo ''
    echo 'Install docker-clean'
    echo '-----------'
    brew install docker-clean
fi