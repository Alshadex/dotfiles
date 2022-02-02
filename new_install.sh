#!/bin/bash

sudo apt update; sudo apt upgrade -y
sudo apt install $(cat apt_packages.txt | tr '\n' ' ')
sudo apt autoremove

sudo snap refresh
sudo snap install discord spotify
sudo snap install code --classic 
sudo snap install slack --classic

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
