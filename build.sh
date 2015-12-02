#!/usr/bin/env bash
#
# @filename: build.sh
#

set -e

docker build -t maint/debian-systemd .

echo -e "\n"
docker images
