#!/bin/bash
# set bash script to exit as soon as exit status is not 0.
set -e


SERVER=alexlin.dev
# read -p "Select 1 for LAN or 2 for WAN: " -n 2 -r
# if [[ $REPLY == 2 ]]
# then
# 	SERVER=70.51.225.248
# fi

# Looking for user directory name
# Use this variable to run script across all devices respective of their hostname.
HOSTNAME=$(hostname)
echo $HOSTNAME


# --size-only: only rsync files that have a size difference.
# --delete: delete files.
# --times (-t): update file last motification timestamp.

echo "Connecting to ip: $SERVER"


# This giant if block is from when I was trying to run bash on android. The phone's hostname was localhost.
if [[ $HOSTNAME == "localhost" ]]
then
	if [[ $1 == "pull" ]]
	then
		if [[ $SERVER == 192.168.2.22 ]]
		then
			rsync -rnvPt --delete --size-only pi@$SERVER:/home/pi/Documents/ /storage/emulated/0/Documents/
			read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
			echo    # (optional) move to a new line
			if [[ $REPLY =~ ^[Yy]$ ]]
			then
				rsync -rvPt --delete --size-only pi@$SERVER:/home/pi/Documents/ /storage/emulated/0/Documents/
			fi
		else
		
			rsync -e "ssh -p 2222" -rnvPt --delete --size-only pi@$SERVER:/home/pi/Documents/ /storage/emulated/0/Documents/
			read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
			echo    # (optional) move to a new line
			if [[ $REPLY =~ ^[Yy]$ ]]
			then
				rsync -e "ssh -p 2222" -rvPt --delete --size-only pi@$SERVER:/home/pi/Documents/ /storage/emulated/0/Documents/
			fi
		fi
	fi
	if [[ $1 == "push" ]]
	then
		if [[ $SERVER == 192.168.2.22 ]]
		then
			rsync -rnvPt --delete --size-only /storage/emulated/0/Documents/ pi@$SERVER:/home/pi/Documents/
			read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
			if [[ $REPLY =~ ^[Yy]$ ]]
			then
				rsync -rvPt --delete --size-only /storage/emulated/0/Documents/ pi@$SERVER:/home/pi/Documents/
			fi
		else
			rsync -e "ssh -p 2222" -rnvPtL --delete --size-only /storage/emulated/0/Documents/ pi@$SERVER:/home/pi/Documents/
			read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
			echo    # (optional) move to a new line
			if [[ $REPLY =~ ^[Yy]$ ]]
			then
				rsync -e "ssh -p 2222" -rvPtL --delete --size-only /storage/emulated/0/Documents/ pi@$SERVER:/home/pi/Documents/
			fi
		fi
	fi
	exit 0
fi


if [[ $1 == "pull" ]]
then
	if [[ $SERVER == 192.168.2.22 ]]
	then
		rsync -rnvPtL --delete --size-only pi@$SERVER:/home/pi/Documents/ /home/adl/Documents/
		read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
		echo    # (optional) move to a new line
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			rsync -rvPtL --delete --size-only pi@$SERVER:/home/pi/Documents/ /home/adl/Documents/
		fi
	else
		rsync -rnvPt --delete --size-only adl@$SERVER:/home/adl/Documents/ /home/adl/Documents/
		read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
		echo    # (optional) move to a new line
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			rsync -rvPt --delete --size-only adl@$SERVER:/home/adl/Documents/ /home/adl/Documents/
		fi
	fi
fi
if [[ $1 == "push" ]]
then
	if [[ $SERVER == 192.168.2.22 ]]
	then
		rsync -rnvPt --delete --size-only /home/adl/Documents/ pi@$SERVER:/home/pi/Documents/
		read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			rsync -rvPt --delete --size-only /home/adl/Documents/ pi@$SERVER:/home/pi/Documents/
		fi
	else
		rsync -rnvPt --delete --size-only /home/adl/Documents/ adl@$SERVER:/home/adl/Documents/
		read -p "Are you sure? ([y]es or [N]o): " -n 2 -r
		echo    # (optional) move to a new line
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			rsync -rvPt --delete --size-only /home/adl/Documents/ adl@$SERVER:/home/adl/Documents/
		fi
	fi
fi

if [[ $1 == "checkip" ]]
then
	scp linalex7@dh2026pc01.utm.utoronto.ca:/student/linalex7/bin/currentIP /home/pi
	cat /home/pi/currentIP
	rm /home/pi/currentIP
fi
