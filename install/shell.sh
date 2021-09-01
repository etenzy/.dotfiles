#!/bin/bash

if [[ ! "$DISABLE_DIRENV" == "true" ]]; then
    echo ''
    echo 'Install direnv'
    echo '--------------'
    brew install direnv
fi

if [[ ! "$DISABLE_NEOFETCH" == "true" ]]; then
    echo ''
    echo 'Install neofetch'
    echo '--------------'
    brew install neofetch
fi

if [[ ! "$DISABLE_OHMYZSH" == "true" ]]; then
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

if [[ ! "$DISABLE_STARSHIP" == "true" ]]; then
    echo ''
    echo 'Install starship-prompt'
    echo '-----------------------'
    brew install starship
    rm -rf $HOME/.config/starship.toml
    ln -nfs $HOME/.dotfiles/shell/config/starship.toml $HOME/.config/starship.toml
fi

if [[ ! "$DISABLE_TMUX" == "true" ]]; then
    echo ''
    echo 'Install tmux'
    echo '------------'
    brew install tmux
    rm -rf $HOME/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [[ ! "$DISABLE_COLORLS" == "true" ]]; then
    echo ''
    echo 'Install colorls'
    echo '---------------'
    brew gem install colorls
    mkdir -p $HOME/.config/colorls
    rm -rf $HOME/.config/colorls/dark_colors.yaml
    ln -nfs $HOME/.dotfiles/shell/config/colorls/dark_colors.yaml $HOME/.config/colorls/dark_colors.yaml
fi

if [[ ! "$DISABLE_DIRCOLORS" == "true" ]]; then
    echo ''
    echo 'Install Nord dircolors theme'
    echo '----------------------------'
    rm -rf $HOME/.dir_colors
    rm -rf $HOME/.dotfiles/shell/dircolors
    git clone https://github.com/arcticicestudio/nord-dircolors.git $HOME/.dotfiles/shell/dircolors
    ln -nfs $HOME/.dotfiles/shell/dircolors/src/dir_colors $HOME/.dir_colors
fi

if [[ ! "$DISABLE_FIGLET" == "true" ]]; then
    echo ''
    echo 'Install figlet'
    echo '--------------'
    brew install figlet

    fontsDir=$(find /usr/local/Cellar/figlet -type d -name "*" -maxdepth 1 | tail -n 1)/share/figlet/fonts

    if [ -d "$fontsDir/.git/" ]; then
        rm -rf $fontsDir
    else
        mv $fontsDir "$fontsDir.bak"
    fi

    git clone https://github.com/xero/figlet-fonts $fontsDir
fi

if [[ ! "$DISABLE_MKLICENSE" == "true" ]]; then
    if command -v npm &> /dev/null
    then
        echo ''
        echo 'Install mklicense'
        echo '-----------------'
        npm install -g mklicense
    fi
fi