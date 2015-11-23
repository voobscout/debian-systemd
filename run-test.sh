#!/bin/sh

set -e

docker run -itd --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro maint/debian-systemd

echo -e "\nContainer ID:"
docker ps -lq
