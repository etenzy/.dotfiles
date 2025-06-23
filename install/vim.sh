#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_VIM_LATEST" == "true" ]]; then
    echo ''
    echo 'Install vim'
    echo '-----------'
    brew install vim

    echo ''
    echo 'Symlink vim preferences'
    echo '-----------------------'
    rm $HOME/.vimrc
    ln -nfs $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
fi

if [[ "$ENABLE_INSTALL_VIMPLUG" == "true" ]]; then
    echo ''
    echo 'Install vim-plug'
    echo '----------------'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +PlugUpdate +PlugUpgrade +PlugClean! +qa!
fi