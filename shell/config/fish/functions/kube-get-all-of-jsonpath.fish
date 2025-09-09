function kube-get-all-of-jsonpath --description "kube-get-all-of-jsonpath <resource> <jsonpath> -- Get <resource> of all Kubernetes namespaces that match <jsonpath>"
    if test (count $argv) -lt 2
        echo "Usage: kube-get-all-of <resource> <jsonpath>" >&2
        return 2
    else
        set resource $argv[1]
        set jsonpath $argv[2]
    end

    for namespace in $(kubectl get namespaces -o name | awk -F '/' '{print $2}' | sort | uniq)
        if test (kubectl auth can-i get $resource --namespace $namespace) = 'yes'
            echo "Namespace:" $namespace
            kubectl get --ignore-not-found $resource --namespace $namespace -o=jsonpath=$jsonpath
            echo ""
        end
    end
end