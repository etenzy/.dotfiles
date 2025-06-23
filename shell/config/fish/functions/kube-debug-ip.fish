function kube-debug-ip --description "kube-debug-ip <ips> <ports> -- Test connectivity to IPs and ports using netcat in a Kubernetes pod"
    kubectl apply -f $kube_netshoot
    kubectl wait --for=condition=ready pod/tmp-shell --timeout=30s \
        && kubectl exec -it tmp-shell -- /bin/sh -c "$(echo-script-nc $argv)"
    kubectl delete -f $kube_netshoot --grace-period=0
end