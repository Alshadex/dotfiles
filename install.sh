#!/bin/bash

SCRIPTLN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
INPATH=".SpaSm-Theme"

: <<'COMMENT'
check_exists(){
	PATH=$1
	echo $PATH
	if [[ -f "$PATH" ]]; then
		echo "$PATH Exists"
		# 0 is True
		return 0
	fi
	return 1
}
COMMENT

cd $SCRIPTLN

mkdir -p ~/$INPATH

# Script copies all config files and directories to ~/.SpaSm-Theme
cp ./.Xresources ~/$INPATH
cp -r ./awesomewm ~/$INPATH
cp -r ./fonts ~/$INPATH

# Softlinks all configs to the users's system. Must have all dependencies.
ln -sf ~/$INPATH/.Xresources ~/.Xresources
ln -sf ~/$INPATH/awesomewm ~/.config/awesome
ln -sf ~/$INPATH/fonts ~/.fonts

echo "Thanks for installing! Hoep you enjoy!"
