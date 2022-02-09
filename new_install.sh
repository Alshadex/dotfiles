#!/bin/bash

sudo apt update; sudo apt upgrade -y
sudo apt install $(cat apt_packages.txt | tr '\n' ' ')
sudo apt autoremove

sudo snap refresh
sudo snap install discord spotify
sudo snap install vlc
# installs nvim 0.6 with lua support
sudo snap install --beta nvim --classic
sudo snap install code --classic 
sudo snap install slack --classic
sudo snap remove firefox # snap firefox does not work with browserpass :/

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
