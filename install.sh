#
# System Installation
#

# Ubuntu generics
sudo apt install cpufrequtils gdebi hexchat clipit

# Desktop environment
sudo apt install ubuntu-gnome-desktop gnome-shell gnome-tweak-tool gdm3

# Development
sudo apt install git emacs guake jekyll libssl-dev meld pandoc parallel apt-transport-https ca-certificates curl software-properties-common libcurl4-openssl-dev

# SQL Databases
sudo apt install mysql-client mysql-server postgresql-common libmysqlclient-dev

# Python
sudo apt install python3-dev python3-pip python-dev python-pip
sudo pip install virtualenvwrapper pyopenssl ipython

# R
sudo apt install r-base gfortran

# JavaScript
# https://stackoverflow.com/questions/43590776/install-node-6-9-on-ubuntu-zesty-17-04
# sudo apt install nodejs npm
# sudo npm install @angular/cli

# Ruby
sudo apt install ruby ruby-dev

# Media
sudo apt install audacity gimp inkscape kazam vlc

# Virtualization
sudo apt isntall virtualbox

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo docker run hello-world

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# Mongo
# NOTE: There's no Mongo repo for non-LTS Ubuntu
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [arch=amd64] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt update
sudo apt install mongodb-org

# Numix icons
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle

# OSX Arc theme
google-chrome https://github.com/LinxGem33/OSX-Arc-Darker

# Insync
google-chrome https://www.insynchq.com/downloads

# Dropbox
google-chrome https://www.dropbox.com

# Skype
google-chrome https://www.skype.com/en/download-skype/skype-for-computer/

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

# To remove notifications
# echo "ui.track_notifications_enabled=false" > ~/.config/spotify/Users/<USER>/prefs

#
# Configuration
#

rm ~/.bashrc

# Bash
ln -s /home/otrenav/Projects/system/dotfiles/bash/bashrc /home/otrenav/.bashrc

# Git
ln -s /home/otrenav/Projects/system/dotfiles/git/gitconfig /home/otrenav/.gitconfig

# Bash-it
git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
mkdir ~/.bash_it/themes/otrenav
ln -s /home/otrenav/Projects/system/dotfiles/bash/otrenav.theme.bash /home/otrenav/.bash_it/themes/otrenav/otrenav.theme.bash

# Emacs
source ~/Projects/system/spacemacs/install.sh

# R
mkdir ~/Projects/system/r/
Rscript ~/Projects/system/dotfiles/r/base_packages.R
