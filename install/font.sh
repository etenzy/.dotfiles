#!/bin/bash

brew tap homebrew/cask-fonts

if [[ "$ENABLE_INSTALL_FONT_FIRA" == "true" ]]; then
    echo ''
    echo 'Install Font Fira'
    echo '-----------------'
    brew install font-fira-code
    brew install font-fira-code-nerd-font
    brew install font-fira-mono
    brew install font-fira-mono-for-powerline
    brew install font-fira-mono-nerd-font
fi

if [[ "$ENABLE_INSTALL_FONT_GITHUB" == "true" ]]; then
    echo ''
    echo 'Install Font Mona Sans'
    echo '-----------------'
    brew install font-mona-sans
    echo ''
    echo 'Install Font Hubot Sans'
    echo '-----------------'
    brew install font-hubot-sans
fi

if [[ "$ENABLE_INSTALL_FONT_HACK" == "true" ]]; then
    echo ''
    echo 'Install Font Hack'
    echo '-----------------'
    brew install font-hack
    brew install font-hack-nerd-font
fi

if [[ "$ENABLE_INSTALL_FONT_INCONSOLALTA" == "true" ]]; then
    echo ''
    echo 'Install Font Inconsolata'
    echo '------------------------'
    brew install font-inconsolata
    brew install font-inconsolata-for-powerline
    brew install font-inconsolata-nerd-font
fi

if [[ "$ENABLE_INSTALL_FONT_MAPLE" == "true" ]]; then
    echo ''
    echo 'Install Font Maple'
    echo '-----------------'
    brew install font-maple
    latest=$(curl -I https://github.com/subframe7536/maple-font/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}')
    curl https://github.com/subframe7536/maple-font/releases/download/$latest/MapleMono-NF.zip -L -o /tmp/MapleMono-NF.zip
fi

if [[ "$ENABLE_INSTALL_FONT_ROBOTO" == "true" ]]; then
    echo ''
    echo 'Install Font Roboto'
    echo '------------------------'
    brew install font-roboto
    brew install font-roboto-mono
    brew install font-roboto-mono-for-powerline
    brew install font-roboto-mono-nerd-font
fi

if [[ "$ENABLE_INSTALL_FONT_SOURCECODEPRO" == "true" ]]; then
    echo ''
    echo 'Install Font Source Code Pro'
    echo '----------------------------'
    brew install font-source-code-pro
    brew install font-source-code-pro-for-powerline
    brew install font-sauce-code-pro-nerd-font
fi

if [[ "$ENABLE_INSTALL_FONT_SYMBOLSNERDFONT" == "true" ]]; then
    echo ''
    echo 'Install Font Symbols Nerd Font'
    echo '------------------------------'
    brew install font-symbols-only-nerd-font 
fi

if [[ "$ENABLE_INSTALL_FONT_VICTORMONO" == "true" ]]; then
    echo ''
    echo 'Install Font Victor Mono'
    echo '------------------------'
    brew install font-victor-mono
    brew install font-victor-mono-nerd-font
fi

