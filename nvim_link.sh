#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

NVIM_CONFIG_DIR="${HOME}/.config/nvim"

if [ -d "$NVIM_CONFIG_DIR" ]; then 
    echo "Existing Neovim configuration found."
    read -p "Are you sure you want to replace? y or n: " -n 2 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -r $NVIM_CONFIG_DIR
    else
        exit 1
    fi 
fi

ln -s ${SCRIPT_DIR}/neovim $NVIM_CONFIG_DIR
echo "Neovim config linked"
