#!/bin/bash

if [[ "$ENABLE_INSTALL_GIT_LATEST" == "true" ]]; then
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
    ln -nfs $HOME/.dotfiles/git/git-commit-template $HOME/.git-commit-template

    if [ ! -f "$HOME/.gitconfig-include" ]; then
		cp "$HOME/.dotfiles/git/gitconfig-include.example" "$HOME/.gitconfig-include"
	fi
fi

if [[ "$ENABLE_INSTALL_GIT_TEAM" == "true" ]]; then
    echo ''
    echo 'Install git-team'
    echo '----------------'
    brew tap hekmekk/git-team
    brew install git-team
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
    brew install profclems/tap/glab
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