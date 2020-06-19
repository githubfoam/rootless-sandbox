#!/bin/bash
set -eox pipefail #safety for script

echo "=============================ansible ============================================================="
echo "===================================================================================="
# METHOD1
dnf update && dnf install python3 -y
# python3 -V
dnf install python3-pip
pip3 install ansible --user
dnf install ansible -y
# METHOD2 Error: Unable to find a match
# yum install  epel-release ansible -y
ansible --version
# cp /vagrant/Makefile .
# cp -r /vagrant/scripts/ .
# ansible --version
# cat <<EOF | sudo tee ansible-local.yml
# ---
#   - name: "Run ansible locally localhost"
#     hosts: localhost
#     connection: local
#     tasks:
#
#     - name: "run ls -lrt command"
#       shell: "ls -lrt"
#       register: "output"
#
#     - debug: var=output.stdout_lines
# EOF
# pwd && ls -lai
# ansible-playbook ansible-local.yml
echo "=========================================================================================="
