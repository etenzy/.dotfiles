#!/bin/bash

if [[ ! "$DISABLE_MICROSOFTTEAMS" == "true" ]]; then
    echo ''
    echo 'Install Microsoft Teams'
    echo '-----------------------'
    brew install microsoft-teams
fi

if [[ ! "$DISABLE_SKYPE" == "true" ]]; then
    echo ''
    echo 'Install Skype'
    echo '-------------'
    brew install skype
fi

if [[ ! "$DISABLE_ZOOM" == "true" ]]; then
    echo ''
    echo 'Install Zoom'
    echo '-------------'
    brew install zoom
fi