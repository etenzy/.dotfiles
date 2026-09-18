function colima-link --description "Relink colima config"
    mkdir -p $HOME/.config/colima/default
    rm -rf $HOME/.config/colima/default/colima.yaml
    ln -nfs $HOME/.dotfiles/shell/config/colima/default/colima.yaml $HOME/.config/colima/default/colima.yaml
end