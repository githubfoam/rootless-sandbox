# rootless-sandbox
rootless docker image build kubernetes cluster

Travis (.com)  branch:
[![Build Status](https://travis-ci.com/githubfoam/rootless-sandbox.svg?branch=dev)](https://travis-ci.com/githubfoam/rootless-sandbox)  

rootless docker w systemd
~~~~

docker info shows rootless in SecurityOptions
docker info shows none as Cgroup Driver

$ docker info

Client:

 Debug Mode: false

Server:

 Containers: 0

  Running: 0

  Paused: 0

  Stopped: 0

 Images: 0

 Server Version: 19.03.11

 Storage Driver: overlay2

  Backing Filesystem: extfs

  Supports d_type: true

  Native Overlay Diff: false

 Logging Driver: json-file

 Cgroup Driver: none

 Plugins:

  Volume: local

  Network: bridge host ipvlan macvlan null overlay

  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog

 Swarm: inactive

 Runtimes: runc

 Default Runtime: runc

 Init Binary: docker-init

 containerd version: 7ad184331fa3e55e52b890ea95e65ba581ae3429

 runc version: dc9208a3303feef5b3839f4323d9beb36df0a9dd

 init version: fec3683

 Security Options:

  seccomp

   Profile: default

  rootless

 Kernel Version: 5.0.0-1031-gcp

 Operating System: Ubuntu 18.04.4 LTS

 OSType: linux

 Architecture: x86_64

 CPUs: 2

 Total Memory: 7.787GiB

 Name: travis-job-01d21210-5515-4d3b-89c6-326a4b90d748

 ID: 7L4Z:HIXF:SVTJ:QGNF:4G3A:77N3:ZWQK:ZSI4:HRQF:ZOXC:E4RC:V6SF

 Docker Root Dir: /home/travis/.local/share/docker

 Debug Mode: false

 Registry: https://index.docker.io/v1/

 Labels:

 Experimental: true

 Insecure Registries:

  127.0.0.0/8

 Live Restore Enabled: false

 Product License: Community Engine
~~~~
rootless docker wo systemd
~~~~

+exec dockerd --experimental

INFO[2020-06-13T20:08:51.644166459Z] Starting up                                  

WARN[2020-06-13T20:08:51.644200109Z] Running experimental build                   

WARN[2020-06-13T20:08:51.644207068Z] Running in rootless mode. Cgroups, AppArmor, and CRIU are disabled.

INFO[2020-06-13T20:08:51.644218306Z] Running with RootlessKit integration         

failed to start daemon: pid file found, ensure docker is not running or delete /run/user/2000/docker.pid

[rootlesskit:child ] error: command [/home/travis/bin/dockerd-rootless.sh --experimental] exited: exit status 1

[rootlesskit:parent] error: child exited: exit status 1
~~~~


~~~~
Run the Docker daemon as a non-root user (Rootless mode)
Rootless mode executes the Docker daemon and containers inside a user namespace. This is very similar to userns-remap mode, except that with userns-remap mode, the daemon itself is running with root privileges, whereas in rootless mode, both the daemon and the container are running without root privileges.
https://docs.docker.com/engine/security/rootless/
~~~~
~~~~
Linux-native "fake root" for rootless containers
https://github.com/rootless-containers/rootlesskit

Projects using RootlessKit
Container engines:
  Podman
Container image builders:
  BuildKit
Kubernetes distributions:
    Usernetes: Docker & Kubernetes, installable under a non-root user's $HOME.
    k3s: Lightweight Kubernetes


~~~~

~~~~
Kubernetes installable under $HOME, without the root privileges
https://github.com/rootless-containers/usernetes
~~~~
~~~~
concurrent, cache-efficient, and Dockerfile-agnostic builder toolkit
Kubernetes deployments
Daemonless
To run client and an ephemeral daemon in a single container ("daemonless mode")

Running BuildKit without root privileges

Building multi-platform images
https://github.com/moby/buildkit
~~~~
~~~~
BuildKit is used by the following projects:
A simple build tool on top of buildkit for building images in a different way.
https://github.com/stellarproject/vab
Rio is an Application Deployment Engine for Kubernetes that can be layered on top of any standard Kubernetes cluster.
https://github.com/rancher/rio
Standalone, daemon-less, unprivileged Dockerfile and OCI compatible container image builder.
https://github.com/genuinetools/img
~~~~
