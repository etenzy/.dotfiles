#!/bin/bash

if [[ ! "$ENABLE_INSTALL_TERRAFORM" == "true" ]]; then
    echo ''
    echo 'Install Terraform'
    echo '-----------------'
    brew install hashicorp/tap/terraform
fi

if [[ ! "$ENABLE_INSTALL_ANSIBLE" == "true" ]]; then
    echo ''
    echo 'Install Ansible'
    echo '---------------'
    brew install ansible
fi

if [[ ! "$ENABLE_INSTALL_OPENSTACK" == "true" ]]; then
    echo ''
    echo 'Install OpenStack CLI'
    echo '---------------------'
    brew install openstackclient
fi

if [[ ! "$ENABLE_INSTALL_AWS" == "true" ]]; then
    echo ''
    echo 'Install AWS CLI'
    echo '---------------'
    brew install awscli
fi

if [[ ! "$ENABLE_INSTALL_GCP" == "true" ]]; then
    echo ''
    echo 'Install Google Cloud SDK'
    echo '------------------------'
    brew install --cask google-cloud-sdk
fi

if [[ ! "$ENABLE_INSTALL_AZURE" == "true" ]]; then
    echo ''
    echo 'Install Azure CLI'
    echo '-----------------'
    brew install azure-cli
fi

if [[ ! "$ENABLE_INSTALL_HETZNER" == "true" ]]; then
    echo ''
    echo 'Install Hetzner Cloud CLI'
    echo '-------------------------'
    brew install hcloud
fi