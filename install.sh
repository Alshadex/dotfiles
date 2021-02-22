#!/bin/bash

SCRIPTLN="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
INPATH=".SpaSm-Theme"

# This function works. -h links, -f file, -d dir... 
check_exists(){
	echo $1
	[ -h $1 ] && echo "Found" || echo "Not found"
	[ -f $1 ] && echo "Found" || echo "Not found"
}
echo $SCRIPTLN
echo $INPATH
TEST="/home/adl/.Xresources"
check_exists "$TEST"

# cd into current directory 
cd $SCRIPTLN

# Makeing temp directory called ".SpaSm-Theme"
mkdir -p ~/$INPATH

# Script copies all config files and directories to ~/.SpaSm-Theme
cp -f ./.Xresources ~/$INPATH
cp -fr ./awesomewm ~/$INPATH
cp -fr ./fonts ~/$INPATH


# Softlinks all configs to the users's system. Must have all dependencies.
ln -sf ~/$INPATH/.Xresources ~/.Xresources
ln -sf ~/$INPATH/awesomewm ~/.config/awesome
ln -sf ~/$INPATH/fonts ~/.fonts

echo "Thanks for installing! Hoep you enjoy!"

: <<'COMMENT'
COMMENT
