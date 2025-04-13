if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew

fish_add_path $HOMEBREW_PREFIX/bin
fish_add_path $HOME/.bin

starship init fish | source
