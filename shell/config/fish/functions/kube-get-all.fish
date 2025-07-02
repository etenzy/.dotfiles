function kube-get-all --description "kube-get-all <namespace> -- Get all resources in a Kubernetes namespace"
    if test (count $argv) -ne 1
        set namespace (kubectl config view --minify -o jsonpath='{.contexts[0].context.namespace}')
    else
        set namespace $argv[1]
    end

    for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq)
        if test (kubectl auth can-i get $i --namespace $namespace) = 'yes'
            echo "Resource:" $i
            kubectl get --ignore-not-found $i --namespace $namespace
            echo ""
        end
    end
end