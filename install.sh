
# TODO: Adjust for Mac
# rm ~/.bash_profile

rm ~/.bashrc

# Docker
# sudo apt install docker-ce

# Dropbox
# sudo apt install dropbox

# Google Chrome
# sudo apt install google-chrome-stable

# Insync
# sudo apt install insync

# Mongo
# sudo apt isntall mongodb

# Themes
# Theme: OSX Arc Darker
# sudo apt install numix-icon-theme-circle

# Skype
# sudo apt install skypeforlinux

# Spotify
# sudo apt install spotify-client

# Ubuntu native packages
sudo apt install audacity autoconf automake bundler clipit cpufrequtils emacs gdebi gdm3 gimp git gnome-shell gnome-tweak-tool guake hexchat inkscape jekyll kazam libmysqlclient-dev libssl-dev meld mysql-client mysql-server mythes-en-au nodejs-legacy npm pandoc parallel postgresql-common python3-dev python3-pip python-dev python-pip r-base ruby ruby-dev ubuntu-gnome-desktop virtualbox vlc

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

# Pip
sudo pip install virtualenvwrapper pyopenssl ipython
