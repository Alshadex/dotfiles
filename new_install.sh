#!/bin/bash

sudo apt update; sudo apt upgrade -y
sudo apt install $(cat apt_packages.txt | tr '\n' ' ')
sudo apt autoremove

sudo snap refresh
sudo snap install discord spotify
sudo snap install --classic code

