#!/bin/bash

if [[ ! "$DISABLE_GIT_LATEST" == "true" ]]; then
    echo ''
    echo 'Install git'
    echo '-----------'
    brew install git

    echo ''
    echo 'Configure Git'
    echo '-------------'
    rm $HOME/.gitconfig
    ln -nfs $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
    rm $HOME/.global-gitignore
    ln -nfs $HOME/.dotfiles/git/global-gitignore $HOME/.global-gitignore
fi

if [[ ! "$DISABLE_GITLFS" == "true" ]]; then
    echo ''
    echo 'Install git-lfs'
    echo '-------------'
    brew install git-lfs
fi

if [[ ! "$DISABLE_GITSIZER" == "true" ]]; then
    echo ''
    echo 'Install git-sizer'
    echo '-----------------'
    brew install git-sizer
fi

if [[ ! "$DISABLE_GITHUB" == "true" ]]; then
    echo ''
    echo 'Install GitHub cli'
    echo '------------------'
    brew install gh
fi

if [[ ! "$DISABLE_GITLAB" == "true" ]]; then
    echo ''
    echo 'Install GitLab cli'
    echo '------------------'
    brew install profclems/tap/glab
fi

if [[ ! "$DISABLE_BFG" == "true" ]]; then
    echo ''
    echo 'Install BFG Repo-Cleaner'
    echo '------------------------'
    brew install bfg
fi