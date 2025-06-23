function echo-script-pg --description "echo-script-pg <ips> [<ports>] [<database>] [<user>] -- Echo a script for testing PostgreSQL connectivity in Kubernetes"
    set -l ports $argv[2]
    test -z "$ports"; and set ports 5432
    
    set -l database $argv[3]
    test -z "$database"; and set database postgres
    
    set -l user $argv[4]
    test -z "$user"; and set user postgres

    render-script $HOME/.dotfiles/kubernetes/test-connection-pg.sh \
        -r=IPS=$argv[1] \
        -r=PORTS="$ports" \
        -r=DATABASE="$database" \
        -r=USER="$user"
end