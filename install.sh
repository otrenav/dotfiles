#
# System Installation
#

# Ubuntu generics
sudo apt install cpufrequtils gdebi hexchat clipit font-manager gnome-tweak-tool skype

# Development
sudo apt install emacs guake meld curl software-properties-common aspell hugo graphviz httpie letsencrypt libssl-dev libcurl4-openssl-dev

# Media
sudo apt install audacity gimp inkscape vlc

# Git
sudo apt install git software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git lfs install

# SQL Databases
sudo apt install mysql-client mysql-server postgresql-common libmysqlclient-dev

# Python
sudo apt install python3-dev python-dev python-pip python3-pip
sudo -H pip install virtualenvwrapper pyopenssl ipython
sudo -H pip3 install black flake8

# R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt update
sudo apt install r-base gfortran

# JavaScript
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install nodejs

# Java
sudo apt install default-jre default-jdk

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# Latex
sudo apt install texlive-latex-base texlive-latex-extra

# Numix icons
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme-circle

# OSX Arc Theme
google-chrome https://github.com/LinxGem33/OSX-Arc-Darker &

# Adapta Nokto Theme
google-chrome https://github.com/adapta-project/adapta-gtk-theme &

# Insync
google-chrome https://www.insynchq.com/downloads &

# Dropbox
google-chrome https://www.dropbox.com &

# Gnome Terminal Atom One Dark Theme
google-chrome https://github.com/denysdovhan/one-gnome-terminal &

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client

# To remove notifications
echo "ui.track_notifications_enabled=false" > ~/.config/spotify/Users/<USER>/prefs

#
# Configuration
#

# Python
rm -rf ~/.flake8rc
ln -s /home/otrenav/Projects/system/dotfiles/python/flake8 /home/otrenav/.flake8rc

# Bash
rm -rf ~/.bashrc
ln -s /home/otrenav/Projects/system/dotfiles/bash/bashrc /home/otrenav/.bashrc

# Git
rm -rf ~/.gitconfig
ln -s /home/otrenav/Projects/system/dotfiles/git/gitconfig /home/otrenav/.gitconfig

# Bash-it
rm -rf ~/.bash_it
git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
mkdir ~/.bash_it/themes/otrenav
ln -s /home/otrenav/Projects/system/dotfiles/bash/otrenav.theme.bash /home/otrenav/.bash_it/themes/otrenav/otrenav.theme.bash

# Emacs
git clone https://gitlab.com/otrenav/spacemacs ~/Projects/system/spacemacs
source ~/Projects/system/spacemacs/install.sh

# R
mkdir ~/Projects/system/r/
Rscript ~/Projects/system/dotfiles/r/base_packages.R
