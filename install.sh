
# Before this repo can be cloned, copy ssh keys to ~/.ssh,
# chmod them to 600, and add them to keyring with ssh-add [key]

# Apps to be installed from Ubuntu Software
# - Telegram
# - Spotify
# - Emacs
# - Gimp
# - Zoom
# - VLC
#
# Apps to be installed from their own websites
# - Slack

sudo apt update
sudo apt upgrade -y

firefox https://www.google.com/intl/en_us/chrome/ &

sudo apt install -y zsh guake gnome-tweaks xclip \
     gnome-shell-extension-prefs flameshot tmux npm \
     apt-transport-https software-properties-common \
     curl tree chrome-gnome-shell meld ca-certificates \
     tidy hunspell aspell pylint python3-hy python3-jedi \
     ripgrep silversearcher-ag fd-find jq most gnupg flatpak \
     python3-flake8 python3-ipython nvtope simplescreenrecorder

echo snap >> ~/.hidden

# Python
sudo apt install -y python3-pip python3-dev python3-venv \
     python3-jedi python3-epc python3-pygments
sudo pip install --break-system-packages black

# Ubuntu does not have `python` command
sudo rm -rf /usr/bin/python
# Select the Python version (install first)
sudo ln -s /usr/local/bin/python3.12 /usr/bin/python

# Git
rm -rf ~/.gitconfig
ln -s ~/code/sys/dotfiles/git/gitconfig ~/.gitconfig

# Fonts: Roboto, Roboto Mono
google-chrome https://fonts.google.com/ &

# Go
google-chrome https://go.dev/doc/install &

# Zsh
rm -rf ~/.oh-my-zsh ~/.zshrc
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

mkdir -p ~/.oh-my-zsh/custom/themes
curl https://raw.githubusercontent.com/fjpalacios/elessar-theme/master/elessar.zsh-theme -L -o ~/.oh-my-zsh/custom/themes/elessar.zsh-theme
ln -s ~/code/sys/dotfiles/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)

# JavaScript / NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.zshrc
nvm_load
nvm install 22
nvm alias default 22
sudo npm install -g tern prettier js-beautify eslint jshint \
     typescript eslint typescript-formatter csslint jsonlint

# Emacs
rm -rf ~/code/sys/spacemacs
git clone git@github.com:otrenav/spacemacs.git ~/code/sys/spacemacs
source ~/code/sys/spacemacs/install.sh

# Docker
sudo apt remove docker docker.io containerd runc
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker ${USER}
sudo systemctl stop docker.service
sudo systemctl stop docker.socket
sudo systemctl disable docker.service
sudo systemctl disable docker.socket

# Fuzzy Finder
ln -s ~/code/sys/dotfiles/fzf/fdignore ~/.fdignore
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Tmux
rm -rf ~/.tmux/
rm -rf ~/.tmux.conf
mkdir -p ~/.tmux/
ln -s ~/code/sys/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Claude
rm -rf ~/.claude/settings.json
ln -s ~/code/sys/dotfiles/claude/settings.json ~/.claude/settings.json

# Google Cloud
sudo rm -f /etc/apt/sources.list.d/google-cloud-sdk.list*
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt update
sudo apt install -y google-cloud-cli
$(gcloud info --format="value(basic.python_location)") -m pip install numpy

# Required by Gnome Extension: System Monitor (?)
sudo apt install -y gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0

# Apps that require manual installation
google-chrome https://www.insynchq.com/downloads &

# Apps installed through gnome-extensions
google-chrome https://extensions.gnome.org/extension/3010/system-monitor-next/ &
google-chrome https://extensions.gnome.org/extension/28/gtile/ &
# Gtile: 2x1 1:1 1:1, 2:1 2:1 (CTRL + SHIFT + RIGHT)
# Gtile: 3x1 1:1 2:1, 2:1 3:1 (SHIFT + ALT + RIGHT)
# Gtile: 3x1 1:1 1:1, 2:1 2:1, 3:1 3:1 (CTRL + ALT + RIGHT)

# Disable animations
# gsettings set org.gnome.desktop.interface enable-animations false

# Remove unnecessary packages
sudo apt autoremove

# Terminal Themes
# NOTE: Requires new profile saved in gnome-terminal (not "Unnamed" default)
# Install Monokai-Dark
# wget -O gogh https://git.io/vQgMr
# chmod +x gogh
# ./gogh
# rm ./gogh

guake --restore-preferences=./guake/guake.cfg
# dconf dump / > ./dconf/main.txt
dconf load / < ./dconf/main.txt

# Citrix
# 1. Install (sudo dpkg -i ica...)
# google-chrome https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html &
# 2. Use to login to gcloud using a GCP session in Citrix
# 3. Uninstall (leaving Citrix installed creates issues for Chrome, Software, etc)
#    - sudo `dpkg --remove icaclient`

# Manually add startup applications
# - Guake (check key)
# - SSH Key Agent
# - InSync
# - Slack

# Manually add nautilus favories
# - downloads
# - personal
# - knowledge
# - mll
# - mll
# - vrs
# - vrs
# - hs
# - hs
# - cb
# - cb
# - alpha
# - alpha
# - [month receipts]
# - shared

# Manually sign-in to Chrome extensions
# - Grammarly

# Change "D/downloads" folder for
# - Chrome (all profiles)
# - Firefox
# - Slack

# Change with Tweak keyboard keys
# - Left CTRL as Compose
# - CAPS LOCK as CTRL

# Nautilus config
# - Show as folders
# - Allow folders to be expanded

# Guake
# - Select Monokai color palette
# - Login with X11/Xorg session
# - Remove shortcuts: C-W, C-Q, C-S-l ("Extra Features")

# Manually set the system-monitor config to "digits"
# Verify `running_services` are fine
# Remove from favorites dash all apps
