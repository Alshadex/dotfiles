#!/bin/bash

# set bash script to exit as soon as exit status is not 0.
set -e

# --size-only: only rsync files that have a size difference.
# --delete: delete files.
# --times (-t): update file last motification timestamp.

# Use --sizeonly with minor changes. When needing to run sync on everything, exclude it.
if [[ $1 == "--size-only" ]]
then
	echo "--size-only flag is on"
	rsync -rnv --delete --times --size-only ~/Documents/ ~/backup/0/docs/
	read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		rsync -rv --delete --times --size-only ~/Documents/ ~/backup/0/docs/
		~/bin/backup01.sh --size-only
	fi
else
	rsync -rnv --delete --times ~/Documents/ ~/backup/0/docs/
	read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		rsync -rv --delete --times ~/Documents/ ~/backup/0/docs/
		~/bin/backup01.sh
	fi
fi
