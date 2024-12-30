#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_MICROSOFTTEAMS" == "true" ]]; then
    echo ''
    echo 'Install Microsoft Teams'
    echo '-----------------------'
    brew install microsoft-teams
fi

if [[ "$ENABLE_INSTALL_SKYPE" == "true" ]]; then
    echo ''
    echo 'Install Skype'
    echo '-------------'
    brew install skype
fi

if [[ "$ENABLE_INSTALL_SLACK" == "true" ]]; then
    echo ''
    echo 'Install Slack'
    echo '-------------'
    brew install slack
fi

if [[ "$ENABLE_INSTALL_ZOOM" == "true" ]]; then
    echo ''
    echo 'Install Zoom'
    echo '-------------'
    brew install zoom
fi