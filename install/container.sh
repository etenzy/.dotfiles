#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_COLIMA" == "true" ]]; then
    echo ''
    echo 'Install colima'
    echo '--------------'
    brew install docker docker-completion docker-compose docker-credential-helper
    brew install colima
    mkdir -p $HOME/.config/colima/default
    rm -rf $HOME/.config/colima/default/colima.yaml
    ln -nfs $HOME/.dotfiles/shell/config/colima/default/colima.yaml $HOME/.config/colima/default/colima.yaml
fi

if [[ "$ENABLE_INSTALL_DOCKER" == "true" ]]; then
    echo ''
    echo 'Install docker Desktop'
    echo '----------------------'
    brew install --cask docker
    brew install docker docker-completion docker-compose docker-credential-helper
fi

if [[ "$ENABLE_INSTALL_PODMAN" == "true" ]]; then
    echo ''
    echo 'Install podman'
    echo '--------------'
    brew install podman
fi