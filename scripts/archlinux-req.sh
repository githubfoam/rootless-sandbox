#!/bin/bash
set -eox pipefail #safety for script

echo "=============================ansible ============================================================="
# https://github.com/rootless-containers/usernetes
pacman -Syu --noconfirm #Update and upgrade  all packages on the system
pacman -Si ansible #Show extensive info about a package
sudo pacman -Syu --noconfirm ansible #Install (and update package list)
pacman -Ql ansible #List files installed by ansible package
cat <<EOF | sudo tee ansible-local.yml
---
  - name: "Run ansible locally localhost"
    hosts: localhost
    connection: local
    tasks:

    - name: "run ls -lrt command"
      shell: "ls -lrt"
      register: "output"

    - debug: var=output.stdout_lines
EOF
pwd && ls -lai
ansible-playbook ansible-local.yml
echo "=============================archlinux requirements ============================================================="
echo "kernel.unprivileged_userns_clone=1" | sudo tee -a /etc/sysctl.conf
cat /etc/sysctl.conf | grep "kernel.unprivileged_userns_clone=1"
sudo sysctl -p
USERNETES_VERSION=20200611.1
echo "=========================================================================================="
