#!/bin/bash

if [[ "$ENABLE_INSTALL_PODMAN" == "true" ]]; then
    echo ''
    echo 'Install podman'
    echo '--------------'
    brew install podman
fi