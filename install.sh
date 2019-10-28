
# Update
sudo apt update -y
sudo apt upgrade -y

# Ubuntu generics
sudo apt install -y cpufrequtils clipit font-manager gnome-tweak-tool dconf-cli uuid-runtime nmap

# Development
sudo apt install -y emacs guake meld curl software-properties-common aspell hugo graphviz httpie letsencrypt libssl-dev libcurl4-openssl-dev silversearcher-ag shellcheck ripgrep

# Media
sudo apt install -y gimp vlc

# Basics
google-chrome https://www.insynchq.com/downloads &
snap install spotify
snap install slack
snap install skype

# Remove blocking and useless keybindings
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"

# Hide ~/snap directory
echo snap >> ~/.hidden

# Git
sudo apt install -y git software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt -y install git-lfs
git lfs install
rm ./script.deb.sh
rm -rf ~/.gitconfig
ln -s ~/code/system/dotfiles/git/gitconfig ~/.gitconfig

# Zsh
sudo apt install zsh
rm -rf ~/.oh-my-zsh
rm -rf ~/.zshrc
rm -rf ~/.zsh-syntax-highlighting
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting --depth 1
mkdir -p ~/.oh-my-zsh/custom/themes
curl https://raw.githubusercontent.com/fjpalacios/elessar-theme/master/elessar.zsh-theme -L -o ~/.oh-my-zsh/custom/themes/elessar.zsh-theme
ln -s ~/code/system/dotfiles/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)

# Tmux
rm -rf ~/.tmux/
mkdir -p ~/.tmux/
ln -s ~/code/system/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/code/system/dotfiles/tmux/scripts ~/.tmux/scripts

# Emacs
git clone https://gitlab.com/otrenav/spacemacs ~/code/system/spacemacs
source ~/code/system/spacemacs/install.sh

# Vim
sudo apt install -y vim
rm -rf ~/.vim
ln -s ~/code/system/dotfiles/vim ~/.vim
mkdir -p ~/.vim/pack/minpac/opt/
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
mkdir ~/.vim/dirs/backups
mkdir ~/.vim/dirs/tmp

# SQL Databases
sudo apt install -y mysql-client mysql-server postgresql-common libmysqlclient-dev

# Python
sudo apt install -y python3-dev python-dev python-pip python3-pip python3-venv virtualenv yapf yapf3
sudo -H pip install pyopenssl ipython autoflake hy jedi radon flake8 ipython importmagic epc virtualenvwrapper
sudo -H pip3 install black flake8 autoflake hy jedi radon flake8 ipython importmagic epc isort[requirements]
mkdir -p ~/code/system/python/
rm -rf ~/.flake8rc ~/.pylintrc
ln -s ~/code/system/dotfiles/python/isort.cfg ~/.isort.cfg
ln -s ~/code/system/dotfiles/python/flake8 ~/.flake8rc

# R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
sudo apt update
sudo apt install -y r-base gfortran
rm -rf ~/.Rprofile
ln -s ~/code/system/dotfiles/r/Rprofile ~/.Rprofile
mkdir ~/code/system/r/
Rscript ~/code/system/dotfiles/r/base_packages.R

# JavaScript
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g tern js-beautify eslint jshint typescript tslint typescript-formatter csslint jsonlint
rm -rf ~/.eslintrc
ln -s ~/code/system/dotfiles/js/eslintrc ~/.eslintrc

# Java
sudo apt install -y default-jre default-jdk

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Bash
rm -rf ~/.bashrc
ln -s ~/code/system/dotfiles/bash/bashrc ~/.bashrc
ln -s ~/code/system/dotfiles/scripts ~/.scripts

# Bash-it
rm -rf ~/.bash_it
git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
mkdir ~/.bash_it/themes/otrenav
ln -s ~/code/system/dotfiles/bash/otrenav.theme.bash ~/.bash_it/themes/otrenav/otrenav.theme.bash

# Fuzzy finder for terminal
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Kubectx
git clone https://github.com/ahmetb/kubectx/ ~/.kubectx
ln -s ~/.kubectx/kubectx ~/.scripts/kubectx
ln -s ~/.kubectx/kubens ~/.scripts/kubens

# Terminal Themes
# Select Monokai Dark
wget -O gogh https://git.io/vQgMr
chmod +x gogh
./gogh
rm ./gogh

# System theme (Ark Dark + Yaru Mouse/Icons)
google-chrome https://github.com/horst3180/arc-theme

# Remove unwanted directories
vim ~/.config/user-dirs.dirs
