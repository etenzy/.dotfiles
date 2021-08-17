#!/bin/bash

echo ''
echo 'Symlink $HOME/.bin'
echo '------------------'
rm -rf $HOME/.bin
ln -nfs $HOME/.dotfiles/bin $HOME/.bin
chmod +x $HOME/.bin/*

if [[ ! "$DISABLE_COREUTILS" == "true" ]]; then
    echo ''
    echo 'Install coreutils'
    echo '-----------------'
    brew install coreutils
fi

if [[ ! "$DISABLE_ACK" == "true" ]]; then
    echo ''
    echo 'Install ack'
    echo '-----------'
    brew install ack
fi

if [[ ! "$DISABLE_ASCIINEMA" == "true" ]]; then
    echo ''
    echo 'Install asciinema'
    echo '-----------------'
    brew install asciinema
fi

if [[ ! "$DISABLE_COWSAY" == "true" ]]; then
    echo ''
    echo 'Install cowsay'
    echo '--------------'
    brew install cowsay
fi

if [[ ! "$DISABLE_CURL" == "true" ]]; then
    echo ''
    echo 'Install curl'
    echo '------------'
    brew install curl
fi

if [[ ! "$DISABLE_FORTUNE" == "true" ]]; then
    echo ''
    echo 'Install fortune'
    echo '---------------'
    brew install fortune
fi

if [[ ! "$DISABLE_GNUPG" == "true" ]]; then
    echo ''
    echo 'Install gnupg'
    echo '-------------'
    brew install gnupg
fi

if [[ ! "$DISABLE_GPGSUITE" == "true" ]]; then
    echo ''
    echo 'Install gpg-suite'
    echo '-----------------'
    brew install gpg-suite
fi

if [[ ! "$DISABLE_GREP" == "true" ]]; then
    echo ''
    echo 'Install grep'
    echo '------------'
    brew install grep
fi

if [[ ! "$DISABLE_HTTPIE" == "true" ]]; then
    echo ''
    echo 'Install httpie'
    echo '--------------'
    brew install httpie
fi

if [[ ! "$DISABLE_HTOP" == "true" ]]; then
    echo ''
    echo 'Install htop'
    echo '------------'
    brew install htop
fi

if [[ ! "$DISABLE_IPROUTE" == "true" ]]; then
    echo ''
    echo 'Install iproute2mac'
    echo '-------------------'
    brew install iproute2mac
fi

if [[ ! "$DISABLE_ITERM" == "true" ]]; then
    echo ''
    echo 'Install iterm2'
    echo '--------------'
    brew install iterm2
fi

if [[ ! "$DISABLE_JQ" == "true" ]]; then
    echo ''
    echo 'Install jq'
    echo '----------'
    brew install jq
fi

if [[ ! "$DISABLE_JSONPP" == "true" ]]; then
    echo ''
    echo 'Install jsonpp'
    echo '--------------'
    brew install jsonpp
fi

if [[ ! "$DISABLE_LESS" == "true" ]]; then
    echo ''
    echo 'Install less'
    echo '------------'
    brew install less
fi

if [[ ! "$DISABLE_PRETTYPING" == "true" ]]; then
    echo ''
    echo 'Install prettyping'
    echo '------------------'
    brew install prettyping
fi

if [[ ! "$DISABLE_PIPEVIEWER" == "true" ]]; then
    echo ''
    echo 'Install Pipe Viewer'
    echo '-------------------'
    brew install pv
fi

if [[ ! "$DISABLE_SCREEN" == "true" ]]; then
    echo ''
    echo 'Install Screen'
    echo '--------------'
    brew install screen
fi

if [[ ! "$DISABLE_SOPS" == "true" ]]; then
    echo ''
    echo 'Install sops'
    echo '------------'
    brew install sops
fi

if [[ ! "$DISABLE_SPEEDTESTCLI" == "true" ]]; then
    echo ''
    echo 'Install speedtest-cli'
    echo '---------------------'
    brew install speedtest-cli
fi

if [[ ! "$DISABLE_TELNET" == "true" ]]; then
    echo ''
    echo 'Install telnet'
    echo '--------------'
    brew install telnet
fi

if [[ ! "$DISABLE_THESILVERSEARCHER" == "true" ]]; then
    echo ''
    echo 'Install the_silver_searcher'
    echo '---------------------------'
    brew install the_silver_searcher
fi

if [[ ! "$DISABLE_ULTIMATEPLUMBER" == "true" ]]; then
    echo ''
    echo 'Install Ultimate Plumber'
    echo '------------------------'
    brew install up
fi

if [[ ! "$DISABLE_WATCH" == "true" ]]; then
    echo ''
    echo 'Install watch'
    echo '-------------'
    brew install watch
fi

if [[ ! "$DISABLE_WGET" == "true" ]]; then
    echo ''
    echo 'Install wget'
    echo '------------'
    brew install wget
fi