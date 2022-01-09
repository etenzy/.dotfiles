#!/bin/bash

if [[ "$ENABLE_INSTALL_COLIMA" == "true" ]]; then
    echo ''
    echo 'Install colima'
    echo '--------------'
    brew install docker docker-compose docker-credential-helper
    brew install colima
fi

if [[ "$ENABLE_INSTALL_PODMAN" == "true" ]]; then
    echo ''
    echo 'Install podman'
    echo '--------------'
    brew install podman
fi