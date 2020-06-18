#!/bin/bash
set -eox pipefail #safety for script

# https://github.com/rootless-containers/usernetes
echo "=============================archlinux requirements ============================================================="
echo "kernel.unprivileged_userns_clone=1" | sudo tee -a /etc/sysctl.conf
cat /etc/sysctl.conf | grep "kernel.unprivileged_userns_clone=1"
sudo sysctl -p
USERNETES_VERSION=20200611.1
echo "=============================archlinux requirements============================================================="
