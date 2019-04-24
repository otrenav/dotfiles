#
# System Installation
#

# Ubuntu generics
sudo apt install -y cpufrequtils hexchat clipit font-manager gnome-tweak-tool skype

# Development
sudo apt install -y emacs guake meld curl software-properties-common aspell hugo graphviz httpie letsencrypt libssl-dev libcurl4-openssl-dev

# Media
sudo apt install -y audacity gimp inkscape vlc

# Git
sudo apt install -y git software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt -y install git-lfs
git lfs install
rm ./script.deb.sh

# SQL Databases
sudo apt install -y mysql-client mysql-server postgresql-common libmysqlclient-dev

# Python
sudo apt install -y python3-dev python-dev python-pip python3-pip python3-venv virtualenv
sudo -H pip install pyopenssl ipython autoflake hy jedi radon flake8 ipython importmagic epc virtualenvwrapper
sudo -H pip3 install black flake8 autoflake hy jedi radon flake8 ipython importmagic epc
mkdir -p ~/code/system/python/

# R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt update
sudo apt install -y r-base gfortran

# JavaScript
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g tern js-beautify eslint jshint typescript tslint typescript-formatter csslint jsonlint

# Ruby
sudo gem install pry pry-doc ruby_parser rubocop

# Java
sudo apt install -y default-jre default-jdk

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Numix icons
sudo apt install numix-icon-theme

# Telikrin Theme
google-chrome https://github.com/paullinuxthemer/Telinkrin-GTK

# Terminal Themes
https://mayccoll.github.io/Gogh/

# Insync
google-chrome https://www.insynchq.com/downloads &

# Slack
google-chrome https://slack.com/downloads/linux

# Spotify
snap install spotify

# To remove notifications
# echo "ui.track_notifications_enabled=false" > ~/.config/spotify/Users/<USER>/prefs

#
# Configuration
#

# Python
rm -rf ~/.flake8rc ~/.pylintrc
ln -s /home/otrenav/code/system/dotfiles/python/flake8 /home/otrenav/.flake8rc

# Bash
rm -rf ~/.bashrc
ln -s /home/otrenav/code/system/dotfiles/bash/bashrc /home/otrenav/.bashrc

# Git
rm -rf ~/.gitconfig
ln -s /home/otrenav/code/system/dotfiles/git/gitconfig /home/otrenav/.gitconfig

# Bash-it
rm -rf ~/.bash_it
git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
mkdir ~/.bash_it/themes/otrenav
ln -s /home/otrenav/code/system/dotfiles/bash/otrenav.theme.bash /home/otrenav/.bash_it/themes/otrenav/otrenav.theme.bash

# Emacs
git clone https://gitlab.com/otrenav/spacemacs ~/code/system/spacemacs
source ~/code/system/spacemacs/install.sh

# R
rm -rf ~/.Rprofile
ln -s /home/otrenav/code/system/dotfiles/r/Rprofile /home/otrenav/.Rprofile
mkdir ~/code/system/r/
Rscript ~/code/system/dotfiles/r/base_packages.R

# JavaScript
rm -rf ~/.eslintrc
ln -s /home/otrenav/code/system/dotfiles/js/eslintrc /home/otrenav/.eslintrc

# Hide ~/snap directory
echo snap >> ~/.hidden

# Remove unwanted directories
emacs ~/.config/user-dirs.dirs

#
# Install custom scripts
#
ln -s /home/otrenav/code/system/dotfiles/scripts/ /home/otrenav/.scripts

#
# Kubernetes
#

# Fuzzy finder for terminal
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Kubectx
git clone https://github.com/ahmetb/kubectx/ ~/.kubectx
ln -s ~/.kubectx/kubectx ~/.scripts/kubectx
ln -s ~/.kubectx/kubens ~/.scripts/kubens
