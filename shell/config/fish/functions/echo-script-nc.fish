function echo-script-nc --description "echo-script-nc <ips> <ports> -- Echo a script for testing connectivity to IPs and ports using netcat in a Kubernetes pod"
    render-script $HOME/.dotfiles/kubernetes/test-connection-nc.sh\
        -r=IPS=$argv[1] \
        -r=PORTS=$argv[1]
end