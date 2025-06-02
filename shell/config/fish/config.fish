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

set -gx CLOUDSDK_CONFIG ''
set -gx AWS_PROFILE ''

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.bin

for file in $HOME/.homebrew-env/*.fish;
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
end

if test -e $HOME/.dotfiles-custom/shell/config/fish/config.fish
    source $HOME/.dotfiles-custom/shell/config/fish/config.fish
end

starship init fish | source
