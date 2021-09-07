#!/bin/bash

if [[ ! "$DISABLE_GO" == "true" ]]; then
    echo ''
    echo 'Install go'
    echo '----------'
    brew install go
fi

if [[ ! "$DISABLE_KUBECTL" == "true" ]]; then
    echo ''
    echo 'Install kubectl'
    echo '---------------'
    brew install kubernetes-cli
    #Download https://github.com/ahmetb/kubectl-aliases/
    curl https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases -s -o ~/.kubectl_aliases
    mkdir -p $HOME/.kube/config.d
fi

if [[ ! "$DISABLE_KUBECOLOR" == "true" ]]; then
    echo ''
    echo 'Install kubecolor'
    echo '-----------------'
    brew install dty1er/tap/kubecolor
fi

if [[ ! "$DISABLE_KUBECTX" == "true" ]]; then
    echo ''
    echo 'Install kubectx'
    echo '---------------'
    brew install kubectx
fi

if [[ ! "$DISABLE_KUBELOGIN" == "true" ]]; then
    echo ''
    echo 'Install kubelogin'
    echo '-----------------'
    brew install int128/kubelogin/kubelogin
fi

if [[ ! "$DISABLE_KUBEONE" == "true" ]]; then
    echo ''
    echo 'Install KubeOne'
    echo '---------------'
    curl -sfL get.kubeone.io | sh
fi

if [[ ! "$DISABLE_FLUX" == "true" ]]; then
    echo ''
    echo 'Install Flux CLI'
    echo '----------------'
    brew install fluxcd/tap/flux
fi

if [[ ! "$DISABLE_KUBEVAL" == "true" ]]; then
    echo ''
    echo 'Install Kubeval'
    echo '---------------'
    brew install instrumenta/instrumenta/kubeval
fi

if [[ ! "$DISABLE_KUBESEAL" == "true" ]]; then
    echo ''
    echo 'Install kubeseal'
    echo '----------------'
    brew install kubeseal
fi

if [[ ! "$DISABLE_HELM" == "true" ]]; then
    echo ''
    echo 'Install helm'
    echo '------------'
    brew install helm
    helm plugin install https://github.com/databus23/helm-diff
    helm plugin install https://github.com/instrumenta/helm-kubeval
    helm repo add yugabytedb https://charts.yugabyte.com
    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
    helm repo add presslabs https://presslabs.github.io/charts
    helm repo add jetstack https://charts.jetstack.io
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo add hashicorp https://helm.releases.hashicorp.com
    helm repo add fluent https://fluent.github.io/helm-charts
    helm repo add fluxcd https://charts.fluxcd.io
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo add grafana https://grafana.github.io/helm-charts
    helm repo add traefik https://helm.traefik.io/traefik
    helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
    helm repo update
fi

if [[ ! "$DISABLE_YAMLHIGHLIGHTER" == "true" ]]; then
    echo ''
    echo 'Install YAML Highlighter'
    echo '------------------------'
    brew install yh
fi

if [[ ! "$DISABLE_MINIKUBE" == "true" ]]; then
    echo ''
    echo 'Install minikube'
    echo '----------------'
    brew install minikube
fi

if [[ ! "$DISABLE_LENS" == "true" ]]; then
    echo ''
    echo 'Install lens'
    echo '------------'
    brew install lens
fi

if [[ ! "$DISABLE_KNINES" == "true" ]]; then
    echo ''
    echo 'Install k9s'
    echo '-----------'
    brew install k9s
fi