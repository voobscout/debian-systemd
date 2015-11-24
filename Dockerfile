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
## UPGRADE OS
##

RUN \
	cp /etc/apt/sources.list /etc/apt/sources.list.origin \
	&& cat /etc/apt/sources.list.origin \
	| sed 's|deb http://httpredir.debian.org/debian jessie main|& contrib non-free|1' \
	| sed 's|deb http://httpredir.debian.org/debian jessie-updates main|& contrib non-free|1' \
	| sed 's|deb http://security.debian.org jessie/updates main|& contrib non-free|1' \
	> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get upgrade -y \


##
## INSTALLING SOMETHING
##

	&& apt-get install -y wget \
	&& chmod -R u=rwx,go= $HOME/.build~/*.sh \


##
## DOCKERIZE SYSTEMD
##

	&& $HOME/.build~/dockerize-systemd.sh \
	&& $HOME/.build~/linux-etc-skel.sh \


##
## CLEANUP
##

	&& apt-get clean \
	&& rm -rf \
		$HOME/.build~ \
		$HOME/.bash_history \
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
