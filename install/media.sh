#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_IMAGEMAGICK" == "true" ]]; then
    echo ''
    echo 'Install imagemagick'
    echo '-------------------'
    brew install imagemagick
fi

if [[ "$ENABLE_INSTALL_PNGQUANT" == "true" ]]; then
    echo ''
    echo 'Install pngquant'
    echo '----------------'
    brew install pngquant
fi

if [[ "$ENABLE_INSTALL_OXIPNG" == "true" ]]; then
    echo ''
    echo 'Install oxipng'
    echo '--------------'
    brew install oxipng
fi

if [[ "$ENABLE_INSTALL_FFMPEG" == "true" ]]; then
    echo ''
    echo 'Install ffmpeg'
    echo '--------------'
    brew install ffmpeg
fi

if [[ "$ENABLE_INSTALL_FLAC" == "true" ]]; then
    echo ''
    echo 'Install flac'
    echo '------------'
    brew install flac
    brew install cuetools
    brew install shntool
fi

if [[ "$ENABLE_INSTALL_MPV" == "true" ]]; then
    echo ''
    echo 'Install mpv'
    echo '-----------'
    brew install homebrew/cask/mpv
    mkdir -p $HOME/.config/mpv/scripts
    curl https://raw.githubusercontent.com/Ashyni/mpv-scripts/master/dynamic-crop.lua -s -o  $HOME/.config/mpv/scripts/dynamic-crop.lua
fi

if [[ "$ENABLE_INSTALL_NOMORESECRETS" == "true" ]]; then
    echo ''
    echo 'Install no-more-secrets'
    echo '-----------------------'
    brew install no-more-secrets
fi

if [[ "$ENABLE_INSTALL_SPOTIFY" == "true" ]]; then
    echo ''
    echo 'Install spotify'
    echo '---------------'
    brew install spotify
fi

if [[ "$ENABLE_INSTALL_VLC" == "true" ]]; then
    echo ''
    echo 'Install vlc'
    echo '-----------'
    brew install vlc
fi

if [[ "$ENABLE_INSTALL_YOUTUBEDL" == "true" ]]; then
    echo ''
    echo 'Install youtube-dl'
    echo '------------------'
    brew install youtube-dl
fi
