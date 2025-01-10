#!/usr/bin/env bash

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
    echo '----------------'
    brew install brew-gem
fi

if [[ "$ENABLE_INSTALL_ACK" == "true" ]]; then
    echo ''
    echo 'Install ack'
    echo '-----------'
    brew install ack
fi

if [[ "$ENABLE_INSTALL_P7ZIP" == "true" ]]; then
    echo ''
    echo 'Install p7zip'
    echo '-------------'
    brew install p7zip
fi

if [[ "$ENABLE_INSTALL_ONEPASSWORDCLI" == "true" ]]; then
    echo ''
    echo 'Install 1Password CLI'
    echo '---------------------'
    brew install 1password-cli
fi

if [[ "$ENABLE_INSTALL_SUDO_TOUCHID" == "true" ]]; then
    echo ''
    echo 'Install sudo-touchid'
    echo '--------------------'
    brew install pam-reattach
    sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
    sudo sed -i '' '/.*pam\_tid\.so/s/^#//g' /etc/pam.d/sudo_local
    sudo bash -eu <<'EOF'
file=/etc/pam.d/sudo_local
# A backup file will be created with the pattern /etc/pam.d/.sudo_local.1
# (where 1 is the number of backups, so that rerunning this doesn't make you lose your original)
bak=$(dirname $file)/.$(basename $file).$(echo $(ls $(dirname $file)/{,.}$(basename $file)* | grep -v template | wc -l))
cp $file $bak
awk -v is_done='pam_reattach' -v rule="auth       optional       $(brew --prefix)/lib/pam/pam_reattach.so" '
{
    # $1 is the first field
    # !~ means "does not match pattern"
    if($1 !~ /^#.*/){
    line_number_not_counting_comments++
    }
    # $0 is the whole line
    if(line_number_not_counting_comments==1 && $0 !~ is_done){
    print rule
    }
    print
}' > $file < $bak
EOF
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
    git clone https://github.com/catppuccin/bat.git $HOME/.dotfiles/shell/catppuccin/bat
    rm -rf "$(bat --config-dir)/themes"
    mkdir -p "$(bat --config-dir)/themes"
    ln -nfs $HOME/.dotfiles/shell/catppuccin/bat/*.tmTheme "$(bat --config-dir)/themes/"
    bat cache --build
fi

if [[ "$ENABLE_INSTALL_BITWARDENCLI" == "true" ]]; then
    echo ''
    echo 'Install bitwarden-cli'
    echo '---------------------'
    brew install bitwarden-cli
fi

if [[ "$ENABLE_INSTALL_BTOP" == "true" ]]; then
    echo ''
    echo 'Install btop'
    echo '------------'
    brew install btop
    git clone https://github.com/catppuccin/btop.git $HOME/.dotfiles/shell/catppuccin/btop
    rm -rf $HOME/.config/btop/themes/
    mkdir -p $HOME/.config/btop/themes/
    ln -nfs $HOME/.dotfiles/shell/catppuccin/btop/*.theme $HOME/.config/btop/themes/
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

if [[ "$ENABLE_INSTALL_HTMLQ" == "true" ]]; then
    echo ''
    echo 'Install htmlq'
    echo '-------------'
    brew install htmlq
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

if [[ "$ENABLE_INSTALL_LSDELUXE" == "true" ]]; then
    echo ''
    echo 'Install LSDeluxe'
    echo '----------------'
    brew install lsd
    mkdir -p $HOME/.config/lsd
    git clone https://github.com/catppuccin/lsd.git $HOME/.dotfiles/shell/catppuccin/lsd
    rm -rf $HOME/.config/lsd/colors.yaml
    ln -nfs $HOME/.dotfiles/shell/catppuccin/lsd/themes/catppuccin-frappe/colors.yaml $HOME/.config/lsd/colors.yaml
    rm -rf $HOME/.config/lsd/config.yaml
    ln -nfs $HOME/.dotfiles/shell/config/lsd $HOME/.config/lsd/config.yaml
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

if [[ "$ENABLE_INSTALL_YQ" == "true" ]]; then
    echo ''
    echo 'Install qy'
    echo '----------'
    brew install yq
fi