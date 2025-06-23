function kube-debug-pg --description "kube-debug-pg <ips> [ports] [database] [user] -- Test PostgreSQL connectivity in a Kubernetes pod"
    kubectl apply -f $kube_psql
    kubectl wait --for=condition=ready pod/tmp-shell --timeout=30s \
        && kubectl exec -it tmp-shell -- /bin/sh -c "$(echo-script-pg $argv)"
    kubectl delete -f $kube_psql --grace-period=0
end