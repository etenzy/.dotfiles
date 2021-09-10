#!/bin/bash

if [[ ! "$DISABLE_MPV" == "true" ]]; then
    echo ''
    echo 'Install mpv'
    echo '-----------'
    brew install homebrew/cask/mpv
    curl https://raw.githubusercontent.com/Ashyni/mpv-scripts/master/dynamic-crop.lua -s -o  ~/.config/mpv/scripts/dynamic-crop.lua
fi

if [[ ! "$DISABLE_NOMORESECRETS" == "true" ]]; then
    echo ''
    echo 'Install no-more-secrets'
    echo '-----------------------'
    brew install no-more-secrets
fi

if [[ ! "$DISABLE_SPOTIFY" == "true" ]]; then
    echo ''
    echo 'Install spotify'
    echo '---------------'
    brew install spotify
fi

if [[ ! "$DISABLE_VLC" == "true" ]]; then
    echo ''
    echo 'Install vlc'
    echo '-----------'
    brew install vlc
fi

if [[ ! "$DISABLE_YOUTUBEDL" == "true" ]]; then
    echo ''
    echo 'Install youtube-dl'
    echo '------------------'
    brew install youtube-dl
fi