#!/bin/bash

# This example is for a Linux OS that uses the DNF package manager
# Your system might use a different method for setting the command line
# that the Linux kernel uses.
sudo apt install dnf -y &&
sudo dnf install -y grubby && \
  sudo grubby \
  --update-kernel=ALL \
  --args="systemd.unified_cgroup_hierarchy=1"

cat <<EOF | sudo tee -a /etc/containerd/config.toml
#   [plugins.cri.containerd]
#   snapshotter = "overlayfs"
#   default_runtime = "runc"
#   [plugins.cri.containerd.runtimes.runc]
#     runtime_type = "io.containerd.runtime.v1.linux"
#     runtime_engine = "/usr/bin/runc"
#     runtime_root = "/run/containerd/runc"

[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
  [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
    SystemdCgroup = true
EOF

sudo sed -i 's/^disabled_plugins.*cri.*/#disabled_plugins = ["cri"]/' /etc/containerd/config.toml

sudo systemctl restart containerd