#!/bin/bash
set -eox pipefail #safety for script

# https://github.com/rootless-containers/usernetes
echo "=============================usernetes cri-o run times ============================================================="
- USERNETES_VERSION=20200611.1
- wget https://github.com/rootless-containers/usernetes/releases/download/v$USERNETES_VERSION/usernetes-x86_64.tbz
- tar xjvf usernetes-x86_64.tbz &&  cd usernetes
echo "=============================usernetes cri-o  run times ============================================================="
