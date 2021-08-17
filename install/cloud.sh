#!/bin/bash

if [[ ! "$DISABLE_TERRAFORM" == "true" ]]; then
    echo ''
    echo 'Install Terraform'
    echo '-----------------'
    brew install hashicorp/tap/terraform
fi

if [[ ! "$DISABLE_ANSIBLE" == "true" ]]; then
    echo ''
    echo 'Install Ansible'
    echo '---------------'
    brew install ansible
fi

if [[ ! "$DISABLE_OPENSTACK" == "true" ]]; then
    echo ''
    echo 'Install OpenStack CLI'
    echo '---------------------'
    brew install openstackclient
fi

if [[ ! "$DISABLE_AWS" == "true" ]]; then
    echo ''
    echo 'Install AWS CLI'
    echo '---------------'
    brew install awscli
fi

if [[ ! "$DISABLE_GCP" == "true" ]]; then
    echo ''
    echo 'Install Google Cloud SDK'
    echo '------------------------'
    brew install --cask google-cloud-sdk
fi

if [[ ! "$DISABLE_AZURE" == "true" ]]; then
    echo ''
    echo 'Install Azure CLI'
    echo '-----------------'
    brew install azure-cli
fi

if [[ ! "$DISABLE_HETZNER" == "true" ]]; then
    echo ''
    echo 'Install Hetzner Cloud CLI'
    echo '-------------------------'
    brew install hcloud
fi