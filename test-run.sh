#!/bin/sh

set -ex

docker run -itd --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro maint/debian-systemd
