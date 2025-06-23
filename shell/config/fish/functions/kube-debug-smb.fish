function kube-debug-smb --description "kube-debug-smb <ip> <share> <user> <password> -- Test SMB connectivity in a Kubernetes pod"
    kubectl apply -f $kube_smb_toolbox
    kubectl wait --for=condition=ready pod/tmp-shell --timeout=30s \
        && kubectl exec -it tmp-shell -- /bin/sh -c "$(echo-script-smb $argv)"
    kubectl delete -f $kube_smb_toolbox --grace-period=0
end