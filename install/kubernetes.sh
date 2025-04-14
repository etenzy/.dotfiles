#!/usr/bin/env bash

if [[ "$ENABLE_INSTALL_TALOSCTL" == "true" ]]; then
    echo ''
    echo 'Install talosctl'
    echo '----------------'
    brew install talosctl
fi

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
    brew install kubectl

    if zsh -c 'command -v asdf' &> /dev/null; then
        asdf plugin add kubectl https://github.com/asdf-community/asdf-kubectl.git
    fi
    
    #Download https://github.com/ahmetb/kubectl-aliases/
    curl https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases -s -o $HOME/.homebrew-env/kubectl
    source $HOME/.homebrew-env/kubectl
    
    # Install kubectl convert
    VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
    curl -LO "https://dl.k8s.io/release/${VERSION}/bin/darwin/arm64/kubectl-convert"
    chmod +x ./kubectl-convert
    sudo mv ./kubectl-convert /usr/local/bin/kubectl-convert

    #Install krew
    if ! zsh -c 'command -v kubectl-krew' &> /dev/null; then
        (
            set -x; cd "$(mktemp -d)" &&
            OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
            ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
            KREW="krew-${OS}_${ARCH}" &&
            curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
            tar zxvf "${KREW}.tar.gz" &&
            ./"${KREW}" install krew
        )
    fi

    if ! echo "$PATH" | grep -q "${KREW_ROOT:-$HOME/.krew}/bin"; then
        echo 'path=("$HOME/.krew/bin" $path)' >> $HOME/.homebrew-env/krew
        source $HOME/.homebrew-env/krew
    fi

    kubectl krew index add netshoot https://github.com/nilic/kubectl-netshoot.git

    #Install kubectl plugins
    kubectl krew update
    kubectl krew install netshoot/netshoot
    kubectl krew install neat
    kubectl krew install cnpg

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
    brew install kubeone
fi

if [[ "$ENABLE_INSTALL_FLUX" == "true" ]]; then
    echo ''
    echo 'Install Flux CLI'
    echo '----------------'
    brew install fluxcd/tap/flux

    if zsh -c 'command -v asdf' &> /dev/null; then
        asdf plugin add flux2 https://github.com/tablexi/asdf-flux2.git
    fi
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
    brew install --cask freelens
fi

if [[ "$ENABLE_INSTALL_KNINES" == "true" ]]; then
    echo ''
    echo 'Install k9s'
    echo '-----------'
    brew install k9s
    mkdir -p $HOME/.config/k9s
    ln -nfs $HOME/.dotfiles/shell/config/k9s/config.yml $HOME/.config/k9s/config.yml
    ln -nfs $HOME/.dotfiles/shell/config/k9s/plugin.yml $HOME/.config/k9s/plugin.yml
    curl https://raw.githubusercontent.com/catppuccin/k9s/main/dist/frappe.yml -s -o ~/.config/k9s/skin.yml
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
