function echo-script-smb --description "echo-script-smb <ip> <share> <user> <password> -- Test SMB connectivity in a Kubernetes pod"
    render-script $HOME/.dotfiles/kubernetes/test-connection-smb.sh \
        -r=IP=$argv[1] \
        -r=SHARE=$argv[2] \
        -r=USER=$argv[3] \
        -r=PASSWORD=$argv[4]
end