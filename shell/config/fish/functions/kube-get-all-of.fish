function kube-get-all-of --description "kube-get-all-of <resource> -- Get <resource> of all Kubernetes namespaces"
    if test (count $argv) -ne 1
        echo "Usage: kube-get-all-of <resource>" >&2
        return 2
    else
        set resource $argv[1]
    end

    for namespace in $(kubectl get namespaces -o name | awk -F '/' '{print $2}' | sort | uniq)
        if test (kubectl auth can-i get $resource --namespace $namespace) = 'yes'
            if test (kubectl get --ignore-not-found $resource --namespace $namespace | wc -l) -gt 0
                echo "Namespace:" $namespace
                kubectl get --ignore-not-found $resource --namespace $namespace
                echo ""
            end
        end
    end
end