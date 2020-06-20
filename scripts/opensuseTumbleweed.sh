#!/bin/bash
set -eox pipefail #safety for script

echo "===================================================================================="
hostnamectl
echo "===================================================================================="
echo "         \   ^__^                                                                  "
echo "          \  (oo)\_______                                                          "
echo "             (__)\       )\/\                                                      "
echo "                 ||----w |                                                         "
echo "                 ||     ||                                                         "

echo "=============================ansible ============================================================="
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
