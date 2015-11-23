#!/bin/sh

set -e

DL_URL=https://raw.githubusercontent.com/htien/linux-etc-skel/master

echo "bash_profile\n\
bashrc\n\
gitconfig" | while read f
do
	wget -qO "$HOME/.$f" "$DL_URL/$f"
done

([ -d $HOME/.ssh/ ] || mkdir $HOME/.ssh/) && wget -qO $HOME/.ssh/config $DL_URL/ssh/config

chmod -R u=rwX,go= $HOME/.bash* $HOME/.gitconfig $HOME/.ssh/
rm -f $HOME/.bash_history
