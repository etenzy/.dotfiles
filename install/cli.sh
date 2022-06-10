#!/bin/bash

echo ''
echo 'Symlink $HOME/.bin'
echo '------------------'
rm -rf $HOME/.bin
ln -nfs $HOME/.dotfiles/bin $HOME/.bin
chmod +x $HOME/.bin/*

if [[ "$ENABLE_INSTALL_COREUTILS" == "true" ]]; then
    echo ''
    echo 'Install coreutils'
    echo '-----------------'
    brew install coreutils
fi

if [[ "$ENABLE_INSTALL_BREWGEM" == "true" ]]; then
    echo ''
    echo 'Install brew-gem'
    echo '-----------------'
    brew install brew-gem
fi

if [[ "$ENABLE_INSTALL_ACK" == "true" ]]; then
    echo ''
    echo 'Install ack'
    echo '-----------'
    brew install ack
fi

if [[ "$ENABLE_INSTALL_ASCIINEMA" == "true" ]]; then
    echo ''
    echo 'Install asciinema'
    echo '-----------------'
    brew install asciinema
fi

if [[ "$ENABLE_INSTALL_BAT" == "true" ]]; then
    echo ''
    echo 'Install bat'
    echo '-----------'
    brew install bat
fi

if [[ "$ENABLE_INSTALL_COWSAY" == "true" ]]; then
    echo ''
    echo 'Install cowsay'
    echo '--------------'
    brew install cowsay
fi

if [[ "$ENABLE_INSTALL_CURL" == "true" ]]; then
    echo ''
    echo 'Install curl'
    echo '------------'
    brew install curl
fi

if [[ "$ENABLE_INSTALL_DUF" == "true" ]]; then
    echo ''
    echo 'Install duf'
    echo '------------'
    brew install duf
fi

if [[ "$ENABLE_INSTALL_FD" == "true" ]]; then
    echo ''
    echo 'Install fd'
    echo '----------'
    brew install fd
fi

if [[ "$ENABLE_INSTALL_FORTUNE" == "true" ]]; then
    echo ''
    echo 'Install fortune'
    echo '---------------'
    brew install fortune
fi

if [[ "$ENABLE_INSTALL_FX" == "true" ]]; then
    echo ''
    echo 'Install fx'
    echo '----------'
    brew install fx
fi

if [[ "$ENABLE_INSTALL_FZF" == "true" ]]; then
    echo ''
    echo 'Install fzf'
    echo '-----------'
    brew install fzf
fi

if [[ "$ENABLE_INSTALL_GNUPG" == "true" ]]; then
    echo ''
    echo 'Install gnupg'
    echo '-------------'
    brew install gnupg
fi

if [[ "$ENABLE_INSTALL_GPGSUITE" == "true" ]]; then
    echo ''
    echo 'Install gpg-suite'
    echo '-----------------'
    brew install gpg-suite
fi

if [[ "$ENABLE_INSTALL_GREP" == "true" ]]; then
    echo ''
    echo 'Install grep'
    echo '------------'
    brew install grep
fi

if [[ "$ENABLE_INSTALL_HTTPIE" == "true" ]]; then
    echo ''
    echo 'Install httpie'
    echo '--------------'
    brew install httpie
fi

if [[ "$ENABLE_INSTALL_HTOP" == "true" ]]; then
    echo ''
    echo 'Install htop'
    echo '------------'
    brew install htop
fi

if [[ "$ENABLE_INSTALL_IPROUTE" == "true" ]]; then
    echo ''
    echo 'Install iproute2mac'
    echo '-------------------'
    brew install iproute2mac
fi

if [[ "$ENABLE_INSTALL_ITERM" == "true" ]]; then
    echo ''
    echo 'Install iterm2'
    echo '--------------'
    brew install iterm2
fi

if [[ "$ENABLE_INSTALL_JQ" == "true" ]]; then
    echo ''
    echo 'Install jq'
    echo '----------'
    brew install jq
fi

if [[ "$ENABLE_INSTALL_JSONPP" == "true" ]]; then
    echo ''
    echo 'Install jsonpp'
    echo '--------------'
    brew install jsonpp
fi

if [[ "$ENABLE_INSTALL_LESS" == "true" ]]; then
    echo ''
    echo 'Install less'
    echo '------------'
    brew install less
fi

if [[ "$ENABLE_INSTALL_LOLCAT" == "true" ]]; then
    echo ''
    echo 'Install lolcat'
    echo '--------------'
    brew install lolcat
fi

if [[ "$ENABLE_INSTALL_PRETTYPING" == "true" ]]; then
    echo ''
    echo 'Install prettyping'
    echo '------------------'
    brew install prettyping
fi

if [[ "$ENABLE_INSTALL_PROGRESS" == "true" ]]; then
    echo ''
    echo 'Install progress'
    echo '----------------'
    brew install progress
fi

if [[ "$ENABLE_INSTALL_PIPEVIEWER" == "true" ]]; then
    echo ''
    echo 'Install Pipe Viewer'
    echo '-------------------'
    brew install pv
fi

if [[ "$ENABLE_INSTALL_RENAME" == "true" ]]; then
    echo ''
    echo 'Install rename'
    echo '--------------'
    brew install rename
fi

if [[ "$ENABLE_INSTALL_SCREEN" == "true" ]]; then
    echo ''
    echo 'Install Screen'
    echo '--------------'
    brew install screen
fi

if [[ "$ENABLE_INSTALL_SOPS" == "true" ]]; then
    echo ''
    echo 'Install sops'
    echo '------------'
    brew install sops
fi

if [[ "$ENABLE_INSTALL_SPEEDTESTCLI" == "true" ]]; then
    echo ''
    echo 'Install speedtest-cli'
    echo '---------------------'
    brew install speedtest-cli
fi

if [[ "$ENABLE_INSTALL_TELNET" == "true" ]]; then
    echo ''
    echo 'Install telnet'
    echo '--------------'
    brew install telnet
fi

if [[ "$ENABLE_INSTALL_THESILVERSEARCHER" == "true" ]]; then
    echo ''
    echo 'Install the_silver_searcher'
    echo '---------------------------'
    brew install the_silver_searcher
fi

if [[ "$ENABLE_INSTALL_TRIVY" == "true" ]]; then
    echo ''
    echo 'Install trivy'
    echo '-------------'
    brew install aquasecurity/trivy/trivy
fi

if [[ "$ENABLE_INSTALL_ULTIMATEPLUMBER" == "true" ]]; then
    echo ''
    echo 'Install Ultimate Plumber'
    echo '------------------------'
    brew install up
fi

if [[ "$ENABLE_INSTALL_WATCH" == "true" ]]; then
    echo ''
    echo 'Install watch'
    echo '-------------'
    brew install watch
fi

if [[ "$ENABLE_INSTALL_WGET" == "true" ]]; then
    echo ''
    echo 'Install wget'
    echo '------------'
    brew install wget
fi

if [[ "$ENABLE_INSTALL_XH" == "true" ]]; then
    echo ''
    echo 'Install xh'
    echo '----------'
    brew install xh
fi