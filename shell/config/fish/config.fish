if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
fish_add_path $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin

for file in $HOME/.homebrew-env/*.fish;
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
end

fish_add_path $HOME/.bin

alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

alias sudo "sudo "
alias watch "watch "

alias ls "gls --color=auto"
alias ll "lsd -la"

alias finder "open ."
alias dotfiles "code -n ~/.dotfiles/"
alias hostfile "sudo vi /etc/hosts"
alias sshconfig "vi ~/.ssh/config"
alias copyed25519 "cat ~/.ssh/id_ed25519.pub | pbcopy"

alias flushdns "sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo \"DNS cache cleared\""

alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

alias afk "pmset displaysleepnow"

alias assume="source $HOMEBREW_PREFIX/bin/assume.fish"

set -gx KUBECONFIG "$HOME/.kube/config"
set -gx kube_netshoot "/Users/michael.roedel/.dotfiles/kubernetes/netshoot.yaml"
set -gx kube_psql "/Users/michael.roedel/.dotfiles/kubernetes/psql.yaml"
set -gx kube_smb_toolbox "/Users/michael.roedel/.dotfiles/kubernetes/smb-toolbox.yaml"
set -gx kube_debian "/Users/michael.roedel/.dotfiles/kubernetes/debian.yaml"

if test -e $HOME/.dotfiles-custom/shell/config/fish/config.fish
    source $HOME/.dotfiles-custom/shell/config/fish/config.fish
end

for file in $HOME/.dotfiles-custom/shell/config/fish/functions/*.fish;
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
end

set -gx EDITOR vim

set -gx CLOUDSDK_CONFIG ''
set -gx AWS_PROFILE ''

starship init fish | source
