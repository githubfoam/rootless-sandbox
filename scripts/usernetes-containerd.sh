#!/bin/bash
set -eox pipefail #safety for script

# https://github.com/rootless-containers/usernetes
echo "=============================usernetes containerd run times ============================================================="
USERNETES_VERSION=20200611.1
wget https://github.com/rootless-containers/usernetes/releases/download/v$USERNETES_VERSION/usernetes-x86_64.tbz
tar xjvf usernetes-x86_64.tbz &&  cd usernetes
#install.sh installs Usernetes systemd units to $HOME/.config/systemd/unit
#use containerd as the CRI runtime (default):
./install.sh --cri=containerd #Failed to connect to bus: Operation not permitted
# - export KUBECONFIG="$HOME/.config/usernetes/master/admin-localhost.kubeconfig" #enable CoreDNS
# - sudo kubectl apply -f manifests/*.yaml
# - kubectl get nodes -o wide
# - ./uninstall.sh
# - ./show-cleanup-command.sh
# - eval $(./show-cleanup-command.sh)
echo "=============================usernetes containerd run times ============================================================="
