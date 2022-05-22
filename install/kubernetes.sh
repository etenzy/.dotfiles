#!/bin/bash

if [[ "$ENABLE_INSTALL_KIND" == "true" ]]; then
    echo ''
    echo 'Install kind'
    echo '----------'
    brew install kind
fi

if [[ "$ENABLE_INSTALL_KUBECTL" == "true" ]]; then
    echo ''
    echo 'Install kubectl'
    echo '---------------'
    brew install kubernetes-cli
    
    #Download https://github.com/ahmetb/kubectl-aliases/
    curl https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases -s -o ~/.kubectl_aliases
    
    # Install kubectl convert
    VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)

    if [ "$(uname -m)" = "arm64" ]; then
        curl -LO "https://dl.k8s.io/release/${VERSION}/bin/darwin/arm64/kubectl-convert"
    else
        curl -LO "https://dl.k8s.io/release/${VERSION}/bin/darwin/amd64/kubectl-convert"
    fi
    chmod +x ./kubectl-convert
    sudo mv ./kubectl-convert /usr/local/bin/kubectl-convert

    mkdir -p $HOME/.kube/config.d
fi

if [[ "$ENABLE_INSTALL_CLUSTERCTL" == "true" ]]; then
    echo ''
    echo 'Install clusterctl'
    echo '-----------------'
    brew install clusterctl
fi

if [[ "$ENABLE_INSTALL_KUBECTX" == "true" ]]; then
    echo ''
    echo 'Install kubectx'
    echo '---------------'
    brew install kubectx
fi

if [[ "$ENABLE_INSTALL_KUBECM" == "true" ]]; then
    echo ''
    echo 'Install kubecm'
    echo '--------------'
    brew install kubecm
fi

if [[ "$ENABLE_INSTALL_KUBELOGIN" == "true" ]]; then
    echo ''
    echo 'Install kubelogin'
    echo '-----------------'
    brew install int128/kubelogin/kubelogin
fi

if [[ "$ENABLE_INSTALL_KUBEONE" == "true" ]]; then
    echo ''
    echo 'Install KubeOne'
    echo '---------------'
    OS=$(uname | tr '[:upper:]' '[:lower:]')
    VERSION=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/kubermatic/kubeone/releases | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' | sort -V | tail -1)

    if [ "$(uname -m)" = "arm64" ]; then
        curl -LO "https://github.com/kubermatic/kubeone/releases/download/v${VERSION}/kubeone_${VERSION}_${OS}_arm64.zip"
        unzip kubeone_${VERSION}_${OS}_arm64.zip -d kubeone_${VERSION}_${OS}_arm64
        sudo mv kubeone_${VERSION}_${OS}_arm64/kubeone /usr/local/bin
        rm -rf kubeone_${VERSION}_${OS}_arm64*
    else
        curl -LO "https://github.com/kubermatic/kubeone/releases/download/v${VERSION}/kubeone_${VERSION}_${OS}_amd64.zip"
        unzip kubeone_${VERSION}_${OS}_amd64.zip -d kubeone_${VERSION}_${OS}_amd64
        sudo mv kubeone_${VERSION}_${OS}_amd64/kubeone /usr/local/bin
        rm -rf kubeone_${VERSION}_${OS}_amd64*
    fi
fi

if [[ "$ENABLE_INSTALL_FLUX" == "true" ]]; then
    echo ''
    echo 'Install Flux CLI'
    echo '----------------'
    brew install fluxcd/tap/flux
fi

if [[ "$ENABLE_INSTALL_KUBESEAL" == "true" ]]; then
    echo ''
    echo 'Install kubeseal'
    echo '----------------'
    brew install kubeseal
fi

if [[ "$ENABLE_INSTALL_HELM" == "true" ]]; then
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

if [[ "$ENABLE_INSTALL_YAMLHIGHLIGHTER" == "true" ]]; then
    echo ''
    echo 'Install YAML Highlighter'
    echo '------------------------'
    brew install yh
fi

if [[ "$ENABLE_INSTALL_MINIKUBE" == "true" ]]; then
    echo ''
    echo 'Install minikube'
    echo '----------------'
    brew install minikube
fi

if [[ "$ENABLE_INSTALL_LENS" == "true" ]]; then
    echo ''
    echo 'Install lens'
    echo '------------'
    brew install lens
fi

if [[ "$ENABLE_INSTALL_KNINES" == "true" ]]; then
    echo ''
    echo 'Install k9s'
    echo '-----------'
    brew install k9s
    mkdir -p $HOME/.config/k9s
    ln -nfs $HOME/.dotfiles/shell/config/k9s/config.yml $HOME/.config/k9s/config.yml
    ln -nfs $HOME/.dotfiles/shell/config/k9s/plugin.yml $HOME/.config/k9s/plugin.yml
    curl https://raw.githubusercontent.com/derailed/k9s/master/skins/nord.yml -s -o ~/.config/k9s/skin.yml
fi

if [[ "$ENABLE_INSTALL_POPEYE" == "true" ]]; then
    echo ''
    echo 'Install Popeye'
    echo '--------------'
    brew install derailed/popeye/popeye
fi

if [[ "$ENABLE_INSTALL_STERN" == "true" ]]; then
    echo ''
    echo 'Install stern'
    echo '--------------'
    brew install stern
fi