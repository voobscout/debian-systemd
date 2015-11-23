#!/bin/sh

set -ex

wget -O $HOME/.bash_profile https://raw.githubusercontent.com/htien/linux-etc-skel/master/bash_profile
wget -O $HOME/.bashrc https://raw.githubusercontent.com/htien/linux-etc-skel/master/bashrc
wget -O $HOME/.gitconfig https://raw.githubusercontent.com/htien/linux-etc-skel/master/gitconfig
wget -O $HOME/.ssh/config https://raw.githubusercontent.com/htien/linux-etc-skel/master/.ssh/config

chmod -R u=rwX,go= $HOME/.bash* $HOME/.gitconfig $HOME/.ssh/
