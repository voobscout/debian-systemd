#!/bin/sh
#
# Docker Maintainers <docker-maint@echip.io>
#
# @filename: sys-cleanup.sh
#

set -e

##
## DO SOMETHING
##

[ -d $HOME/bin ] || mkdir $HOME/bin
chmod u=rwx,go= $HOME/bin

cat > $HOME/bin/sys-cleanup.sh <<'EOF'
#!/bin/sh
#
# Docker Maintainers <docker-maint@echip.io>
#
# @filename: sys-cleanup.sh
#

set -e

apt-get clean

rm -rf \
	$HOME/.bash_history \
	/var/log/apt/* \
	/var/log/alternatives.log \
	/var/log/bootstrap.log \
	/var/log/dpkg.log \
	/var/log/lib/apt/lists/* \
	/var/tmp/* \
	/tmp/*
EOF

chmod u=rwx,go= $HOME/bin/sys-cleanup.sh


##
## PERFORM CLEANUP
##

$HOME/bin/sys-cleanup.sh

