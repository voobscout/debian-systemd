#!/bin/sh

set -e

docker rmi -f maint/debian-systemd
docker images
