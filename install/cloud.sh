#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_PACKER" == "true" ]]; then
    echo ''
    echo 'Install Packer'
    echo '--------------'
    brew install hashicorp/tap/packer
fi

if [[ "$ENABLE_INSTALL_OPENTOFU" == "true" ]]; then
    echo ''
    echo 'Install OpenTofu'
    echo '----------------'
    brew install opentofu
    echo 'complete -o nospace -C "$HOMEBREW_PREFIX/bin/tofu" tofu' >> $HOME/.homebrew-env/opentofu
fi

if [[ "$ENABLE_INSTALL_ANSIBLE" == "true" ]]; then
    echo ''
    echo 'Install Ansible'
    echo '---------------'
    brew install ansible
fi

if [[ "$ENABLE_INSTALL_OPENSTACK" == "true" ]]; then
    echo ''
    echo 'Install OpenStack CLI'
    echo '---------------------'
    brew install openstackclient
fi

if [[ "$ENABLE_INSTALL_AWS" == "true" ]]; then
    echo ''
    echo 'Install AWS CLI'
    echo '---------------'
    brew install awscli
    brew tap common-fate/granted
    brew install granted
fi

if [[ "$ENABLE_INSTALL_GCP" == "true" ]]; then
    echo ''
    echo 'Install Google Cloud SDK'
    echo '------------------------'
    brew install --cask google-cloud-sdk
    echo 'source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"' >> $HOME/.homebrew-env/google-cloud-sdk
    echo 'source "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"' >> $HOME/.homebrew-env/google-cloud-sdk
fi

if [[ "$ENABLE_INSTALL_AZURE" == "true" ]]; then
    echo ''
    echo 'Install Azure CLI'
    echo '-----------------'
    brew install azure-cli
fi

if [[ "$ENABLE_INSTALL_HETZNER" == "true" ]]; then
    echo ''
    echo 'Install Hetzner Cloud CLI'
    echo '-------------------------'
    brew install hcloud
fi