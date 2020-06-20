#!/bin/sh
set -eox pipefail #safety for script
echo $SHELL # freebsd shell

echo "===================================================================================="
uname -a
echo "===================================================================================="
echo "         \   ^__^                                                                  "
echo "          \  (oo)\_______                                                          "
echo "             (__)\       )\/\                                                      "
echo "                 ||----w |                                                         "
echo "                 ||     ||                                                         "

echo "=============================ansible ============================================================="
# make -C /usr/ports/sysutils/ansible install # install from ports
# pkg install py27-ansible #Python 2 version
pkg install sudo #If the sudo command not foun
type sudo #must have sudo installed
#Allow members of group wheel to execute any command
stat /usr/local/etc/sudoers.d/allow-wheel-user-login
echo '%wheel ALL=(ALL) ALL' | sudo tee /usr/local/etc/sudoers.d/allow-wheel-user-login
cat /usr/local/etc/sudoers.d/allow-wheel-user-login


pkg install python36 #Install Python 2.x or Python 3.x
type python3.6

pkg install --yes py37-ansible-2.9.7 #Python 3 version

ansible --version
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
ansible --version

cat <<EOF | sudo tee hosts
[grouphosts]
192.168.40.100
192.168.40.101
192.168.40.102
EOF
# ansible -u vagrant -i hosts -m raw -a 'uptime' grouphosts
# ansible -u vagrant -i hosts -m raw -a 'hostname' grouphosts
echo "=========================================================================================="
