#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_GIT_LATEST" == "true" ]]; then
    echo ''
    echo 'Install git'
    echo '-----------'
    brew install git diff-so-fancy

    echo ''
    echo 'Configure Git'
    echo '-------------'
    rm $HOME/.gitconfig
    cp "$HOME/.dotfiles/git/gitconfig" "$HOME/.gitconfig"
    rm $HOME/.gitconfig-default
    ln -nfs $HOME/.dotfiles/git/gitconfig-default $HOME/.gitconfig-default
    rm $HOME/.gitignore-global
    ln -nfs $HOME/.dotfiles/git/gitignore-global $HOME/.gitignore-global
    rm $HOME/.git-commit-template
    ln -nfs $HOME/.dotfiles/git/git-commit-template $HOME/.git-commit-template

    if [ ! -f "$HOME/.gitconfig-include" ]; then
		cp "$HOME/.dotfiles/git/gitconfig-include.example" "$HOME/.gitconfig-include"
	fi
fi

if [[ "$ENABLE_INSTALL_GIT_METEOR" == "true" ]]; then
    echo ''
    echo 'Install git-meteor'
    echo '------------------'
    brew tap stefanlogue/tools
    brew install --cask meteor
    rm -rf mkdir -p $HOME/.config/meteor
    mkdir -p $HOME/.config/meteor
    ln -nfs $HOME/.dotfiles/shell/config/meteor/config.json $HOME/.config/meteor/config.json
fi

if [[ "$ENABLE_INSTALL_GIT_FILTER_REPO" == "true" ]]; then
    echo ''
    echo 'Install git-filter-repo'
    echo '-----------------------'
    brew install git-filter-repo
fi

if [[ "$ENABLE_INSTALL_GITLFS" == "true" ]]; then
    echo ''
    echo 'Install git-lfs'
    echo '---------------'
    brew install git-lfs
fi

if [[ "$ENABLE_INSTALL_GITSIZER" == "true" ]]; then
    echo ''
    echo 'Install git-sizer'
    echo '-----------------'
    brew install git-sizer
fi

if [[ "$ENABLE_INSTALL_GITHUB" == "true" ]]; then
    echo ''
    echo 'Install GitHub cli'
    echo '------------------'
    brew install gh
fi

if [[ "$ENABLE_INSTALL_GITLAB" == "true" ]]; then
    echo ''
    echo 'Install GitLab cli'
    echo '------------------'
    brew install glab
fi

if [[ "$ENABLE_INSTALL_BFG" == "true" ]]; then
    echo ''
    echo 'Install BFG Repo-Cleaner'
    echo '------------------------'
    brew install bfg
fi

if [[ "$ENABLE_INSTALL_PRECOMMIT" == "true" ]]; then
    echo ''
    echo 'Install pre-commit'
    echo '------------------'
    brew install pre-commit
fi

if [[ "$ENABLE_INSTALL_LOLCOMMITS" == "true" ]]; then
    echo ''
    echo 'Install lolcommits'
    echo '------------------'
    brew gem install lolcommits
fi
