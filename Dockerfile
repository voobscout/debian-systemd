FROM debian:jessie

MAINTAINER Debian-Systemd Docker Maintainers <docker-maint@echip.io>

LABEL description="Debian-Systemd dockerfile for everyone." vendor="HVA Team" version="1.0"

ENV \
	HOME=/root \

	# Let the container know that there is no tty
	DEBIAN_FRONTEND=noninteractive \

	container=docker

WORKDIR /root

COPY build/* ./.build~/

##
## DOCKERIZE SYSTEMD
##

RUN \
	$HOME/.build~/dockerize-systemd.sh \
	$HOME/.build~/linux-etc-skel.sh \


##
## CLEANUP
##

	&& rm -rf \
		$HOME/.build~ \
		/var/log/apt/* \
		/var/log/alternatives.log \
		/var/log/bootstrap.log \
		/var/log/dpkg.log \
		/var/log/lib/apt/lists/* \
		/var/tmp/* \
		/tmp/*


##
## FINAL
##

VOLUME ["/sys/fs/cgroup"]

ENTRYPOINT ["/bin/systemd"]
CMD []

ONBUILD RUN apt-get update
