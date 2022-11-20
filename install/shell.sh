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
    git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    ln -nfs $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
    ln -nfs $HOME/.dotfiles/shell/tmux.conf.local $HOME/.tmux.conf.local
fi

if [[ "$ENABLE_INSTALL_OPENSSH" == "true" ]]; then
    echo ''
    echo 'Install openssh'
    echo '---------------'
    brew install openssh
fi

if [[ "$ENABLE_INSTALL_LSDELUXE" == "true" ]]; then
    echo ''
    echo 'Install LSDeluxe'
    echo '----------------'
    brew install lsd
    rm -rf $HOME/.config/lsd
    ln -nfs $HOME/.dotfiles/shell/config/lsd $HOME/.config/lsd
fi

if [[ "$ENABLE_INSTALL_DIRCOLORS" == "true" ]]; then
    echo ''
    echo 'Install Nord dircolors theme'
    echo '----------------------------'
    rm -rf $HOME/.dir_colors
    rm -rf $HOME/.dotfiles/shell/dircolors
    git clone https://github.com/arcticicestudio/nord-dircolors.git $HOME/.dotfiles/shell/dircolors
    ln -nfs $HOME/.dotfiles/shell/dircolors/src/dir_colors $HOME/.dir_colors
fi

if [[ "$ENABLE_INSTALL_FIGLET" == "true" ]]; then
    echo ''
    echo 'Install figlet'
    echo '--------------'
    brew install figlet

    fontsDir=$(find $(brew --prefix)/Cellar/figlet -type d -name "*" -maxdepth 1 | tail -n 1)/share/figlet/fonts

    if [ -d "$fontsDir/.git/" ]; then
        rm -rf $fontsDir
    else
        mv $fontsDir "$fontsDir.bak"
    fi

    git clone https://github.com/xero/figlet-fonts $fontsDir
fi

if [[ "$ENABLE_INSTALL_MKLICENSE" == "true" ]]; then
    if command -v npm &> /dev/null
    then
        echo ''
        echo 'Install mklicense'
        echo '-----------------'
        npm install -g mklicense
    fi
fi
