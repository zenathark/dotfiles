#!/usr/bin/env bash

if [[ -z "$XDG_DATA_HOME" ]]; then
	XDG_DATA_HOME=$HOME/.nvim
fi

while read -r line;
do
	directory=$(echo ${line} | awk -F/ '{print $NF}' | sed -r 's/\.git//')
	cd $XDG_DATA_HOME/nvim/site/pack
	if ! [ -d $XDG_DATA_HOME/nvim/site/pack/$directory ]; then
		#echo "Installing $line..."
		git clone $line
	else
		echo "Installed already $line"
	fi
done < "PLUGINS"
