#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_GHOSTTY" == "true" ]]; then
    echo ''
    echo 'Install ghostty'
    echo '---------------'
    brew install ghostty
    rm -rf $HOME/.config/ghostty
    mkdir -p $HOME/.config/ghostty
    ln -nfs $HOME/.dotfiles/shell/config/ghostty/config $HOME/.config/ghostty/config
fi

if [[ "$ENABLE_INSTALL_DIRENV" == "true" ]]; then
    echo ''
    echo 'Install direnv'
    echo '--------------'
    brew install direnv
fi

if [[ "$ENABLE_INSTALL_FASTFETCH" == "true" ]]; then
    echo ''
    echo 'Install fastfetch'
    echo '-----------------'
    brew install fastfetch
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
    echo 'source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"' >> $HOME/.homebrew-env/zsh-autosuggestions
    source $HOME/.homebrew-env/zsh-autosuggestions

    echo ''
    echo 'Install zsh-completions'
    echo '-----------------------'
    brew install zsh-completions
    chmod go-w "$HOMEBREW_PREFIX/share"
    rm -f ~/.zcompdump; compinit

    echo ''
    echo 'Install zsh-syntax-highlighting'
    echo '-------------------------------'
    brew install zsh-syntax-highlighting
    git clone https://github.com/catppuccin/zsh-syntax-highlighting.git $HOME/.dotfiles/shell/catppuccin/zsh-syntax-highlighting
    echo 'source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"' >> $HOME/.homebrew-env/zsh-syntax-highlighting
    echo 'source "$HOME/.dotfiles/shell/catppuccin/zsh-syntax-highlighting/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh"' >> $HOME/.homebrew-env/zsh-syntax-highlighting
    source $HOME/.homebrew-env/zsh-syntax-highlighting

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

if [[ "$ENABLE_INSTALL_FISH" == "true" ]]; then
    echo ''
    echo 'Install fish'
    echo '-----------'
    brew install fish fisher
    brew install fisher
    brew install babelfish
    echo $(which fish) | sudo tee -a /etc/shells
fi

if [[ "$ENABLE_INSTALL_FISH_DEFAULT" == "true" ]]; then
    echo ''
    echo 'Set fish as default shell'
    echo '-------------------------'
    chsh -s $(which fish)
fi

if [[ "$ENABLE_INSTALL_FISH_CONFIG" == "true" ]]; then
    echo ''
    echo 'Symlink fish preferences'
    echo '------------------------'
    mkdir -p $HOME/.config/fish
    rm -rf $HOME/.config/fish/config.fish
    ln -nfs $HOME/.dotfiles/shell/config/fish/config.fish $HOME/.config/fish/config.fish
    rm -rf $HOME/.config/fish/functions
    ln -nfs $HOME/.dotfiles/shell/config/fish/functions $HOME/.config/fish/functions

    fisher install catppuccin/fish
    fish_config theme save "Catppuccin Frappe"
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
