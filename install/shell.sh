#!/bin/bash

if [[ "$ENABLE_INSTALL_DIRENV" == "true" ]]; then
    echo ''
    echo 'Install direnv'
    echo '--------------'
    brew install direnv
fi

if [[ "$ENABLE_INSTALL_NEOFETCH" == "true" ]]; then
    echo ''
    echo 'Install neofetch'
    echo '--------------'
    brew install neofetch
fi

if [[ "$ENABLE_INSTALL_OHMYZSH" == "true" ]]; then
    echo ''
    echo 'Install oh-my-zsh'
    echo '-----------------'
    brew install zsh
    rm -rf $HOME/.oh-my-zsh
    rm $HOME/.zprofile
    rm $HOME/.zshrc
    curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

    echo ''
    echo 'Install zplug'
    echo '-------------'
    brew install zplug

    echo ''
    echo 'Install zsh-autosuggestions'
    echo '---------------------------'
    brew install zsh-autosuggestions

    echo ''
    echo 'Install zsh-completions'
    echo '-----------------------'
    brew install zsh-completions
    chmod go-w '$(brew --prefix)/share'
    rm -f ~/.zcompdump; compinit

    echo ''
    echo 'Install zsh-syntax-highlighting'
    echo '-------------------------------'
    brew install zsh-syntax-highlighting
    git clone https://github.com/catppuccin/zsh-syntax-highlighting.git $HOME/.dotfiles/shell/catppuccin/zsh-syntax-highlighting

    echo ''
    echo 'Symlink shell preferences'
    echo '-----------------------'
    rm $HOME/.zshrc
    ln -nfs $HOME/.dotfiles/shell/zshrc $HOME/.zshrc

    rm $HOME/.zprofile
    ln -nfs $HOME/.dotfiles/shell/zprofile $HOME/.zprofile

    rm $HOME/.aliases
    ln -nfs $HOME/.dotfiles/shell/aliases $HOME/.aliases

    rm $HOME/.exports
    ln -nfs $HOME/.dotfiles/shell/exports $HOME/.exports

    rm $HOME/.functions
    ln -nfs $HOME/.dotfiles/shell/functions $HOME/.functions

    compaudit | xargs chmod go-w
fi

if [[ "$ENABLE_INSTALL_STARSHIP" == "true" ]]; then
    echo ''
    echo 'Install starship-prompt'
    echo '-----------------------'
    brew install starship
    rm -rf $HOME/.config/starship.toml
    ln -nfs $HOME/.dotfiles/shell/config/starship.toml $HOME/.config/starship.toml
fi

if [[ "$ENABLE_INSTALL_TMUX" == "true" ]]; then
    echo ''
    echo 'Install tmux'
    echo '------------'
    brew install tmux
    rm -rf $HOME/.tmux
    mkdir $HOME/.tmux
    ln -nfs $HOME/.dotfiles/shell/tmux.conf $HOME/.tmux.conf
    git clone https://github.com/tmux-plugins/tpm.git $HOME/.tmux/plugins/tpm
    bash $HOME/.tmux/plugins/tpm/scripts/install_plugins.sh
fi

if [[ "$ENABLE_INSTALL_OPENSSH" == "true" ]]; then
    echo ''
    echo 'Install openssh'
    echo '---------------'
    brew install openssh
fi

if [[ "$ENABLE_INSTALL_LS_COLORS" == "true" ]]; then
    echo ''
    echo 'Install LS_COLORS theme'
    echo '----------------------------'
    rm -rf $HOME/.LS_COLORS
    ln -nfs $HOME/.dotfiles/shell/LS_COLORS $HOME/.LS_COLORS
fi
