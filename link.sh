#!/bin/bash

USAGE="$(basename "$0") program_name -- link the configuration files for the program

where:
    program_name    the name of the program to link the configuration files for

Example:
    ./$(basename "$0") nvim
    ./$(basename "$0") waybar
    ./$(basename "$0") hypr
"
#
# At least one argument is required
#
if [ -z $1 ]; then
    echo "${USAGE}"
    exit 1
fi

PROGRAM=$1
SCRIPT_DIR="$(pwd)/${PROGRAM}"
LOCAL_CONFIG_DIR="${HOME}/.config/"
LOCAL_PROGRAM_DIR="${LOCAL_CONFIG_DIR}${PROGRAM}"

if [ -d "${LOCAL_PROGRAM_DIR}" ] || [ -h "${LOCAL_PROGRAM_DIR}" ]; then
    echo "Existing ${PROGRAM} configuration found."
    read -p "Are you sure you want to replace? y or n: " -n 2 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -r $LOCAL_PROGRAM_DIR
    else
        exit 1
    fi
fi

ln -s ${SCRIPT_DIR} $LOCAL_PROGRAM_DIR
echo "${PROGRAM} config linked"
