#!/usr/bin/env bash
#
# @filename: remove-image.sh
#

set -e

docker rmi -f maint/debian-systemd

echo -e "\n"
docker images
