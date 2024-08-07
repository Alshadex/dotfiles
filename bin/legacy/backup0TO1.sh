#!/bin/bash
rsync -rnv --delete --times ~/backup/0/ ~/backup/1/

read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -rv --progress --delete --times ~/backup/0/ ~/backup/1/
fi
