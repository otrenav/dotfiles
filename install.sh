
# Update
sudo apt update -y
sudo apt upgrade -y

# Apps
firefox https://www.google.com/intl/en_us/chrome/
google-chrome https://www.insynchq.com/downloads &
google-chrome https://desktop.telegram.org/ &

# Generics
sudo apt install -y cpufrequtils gnome-tweak-tool dconf-cli transmission ffmpeg audacity simplescreenrecorder emacs guake meld curl software-properties-common aspell libssl-dev libcurl4-openssl-dev shellcheck ripgrep cmake mono-devel most fd-find jq zsh apt-transport-https ca-certificates obs-studio

# Git
sudo add-apt-repository ppa:git-core/ppa
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt -y install git-lfs
git lfs install
rm -rf ~/.gitconfig
ln -s ~/projects/system/dotfiles/git/gitconfig ~/.gitconfig

# Fonts: Roboto, Roboto Mono
google-chrome https://fonts.google.com/

# Snap
snap install vlc spotify gimp
snap install skype --classic
snap install slack --classic
echo snap >> ~/.hidden

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install -y yarn

# Zsh
ln -s ~/projects/system/dotfiles/scripts ~/.scripts
rm -rf ~/.oh-my-zsh ~/.zshrc ~/.zsh-syntax-highlighting
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting --depth 1
mkdir -p ~/.oh-my-zsh/custom/themes
curl https://raw.githubusercontent.com/fjpalacios/elessar-theme/master/elessar.zsh-theme -L -o ~/.oh-my-zsh/custom/themes/elessar.zsh-theme
ln -s ~/projects/system/dotfiles/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)

# SQL Databases
sudo apt install -y mysql-client mysql-server libmysqlclient-dev

# Python
sudo apt install -y python3-pip python3-dev python3-pip python3-venv virtualenv yapf3
sudo pip3 install autoflake hy jedi radon flake8 ipython importmagic epc black flake8 autoflake hy jedi radon flake8 ipython importmagic epc isort pyopenssl ipython autoflake hy jedi radon flake8 ipython importmagic epc virtualenvwrapper
mkdir -p ~/projects/system/python/
rm -rf ~/.flake8rc ~/.pylintrc
ln -s ~/projects/system/dotfiles/python/isort.cfg ~/.isort.cfg
ln -s ~/projects/system/dotfiles/python/flake8 ~/.flake8rc

# R
sudo apt install libxml2-dev
echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" | sudo tee -a /etc/apt/sources.list.d/r.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo apt update
sudo apt install -y r-base gfortran
rm -rf ~/.Rprofile
ln -s ~/projects/system/dotfiles/r/Rprofile ~/.Rprofile
mkdir ~/projects/system/r/
Rscript ~/projects/system/dotfiles/r/base_packages.R

# JavaScript/NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
source ~/.zshrc
nvm install 10
nvm install 14
nvm alias default 10
npm install -g tern js-beautify eslint jshint typescript typescript-formatter csslint jsonlint prettier
rm -rf ~/.eslintrc
ln -s ~/projects/system/dotfiles/js/eslintrc ~/.eslintrc

# Emacs
rm -rf ~/projects/system/spacemacs
git clone git@gitlab.com:otrenav/spacemacs.git ~/projects/system/spacemacs
source ~/projects/system/spacemacs/install.sh

# Java
sudo apt install -y default-jre default-jdk

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
sudo systemctl stop docker.service docker.socket
sudo systemctl disable docker.service docker.service

# Fuzzy finder for terminal
ln -s ~/projects/system/dotfiles/fzf/fdignore ~/.fdignore
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Kubectx
git clone https://github.com/ahmetb/kubectx/ ~/.kubectx
rm -rf ~/.scripts/kubectx ~/.scripts/kubens
ln -s ~/.kubectx/kubectx ~/.scripts/kubectx
ln -s ~/.kubectx/kubens ~/.scripts/kubens

# Google Cloud (GCP)
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update && sudo apt install -y google-cloud-sdk

# System theme
# NOTE: Currently using default yaru-dark
# google-chrome https://github.com/horst3180/arc-theme

# Remove unwanted directories
emacs ~/.config/user-dirs.dirs

# Rust (.zshrc already contains config)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Ubuntu Dock
# NOTE: In Ubuntu 19.10 the dock and desktop icons are very annoying
# and can't be disabled, so we make their extensions unreachable
sudo mv /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com/ /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com.backup/
sudo mv /usr/share/gnome-shell/extensions/desktop-icons@csoriano/ /usr/share/gnome-shell/extensions/desktop-icons@csoriano.backup/

# Disable printing service
sudo systemctl stop cups.service cups.socket cups.path cups-browsed.service
sudo systemctl disable cups.service cups.socket cups.path cups-browsed.service

# Externals
google-chrome https://extensions.gnome.org/extension/600/launch-new-instance/ &
google-chrome https://extensions.gnome.org/extension/120/system-monitor/ &
google-chrome https://extensions.gnome.org/extension/28/gtile/ &

# Remove desktop icons
sudo apt remove -y gnome-shell-extension-desktop-icons

# Remove Thunderbird
sudo apt remove -y thunderbird

# Add new keybindings
gsettings set org.gnome.desktop.wm.keybindings close "['<Primary>q']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>grave']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Primary><Shift>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Primary><Shift>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Primary>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Primary>Up']"

# Custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"

# Emacs
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Emacs"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "emacs"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Primary><Alt>e"

# Slack
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "Slack"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "slack"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Primary><Alt>s"

# Downloads
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "Downloads"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "nautilus /home/otrenav/downloads"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "<Primary><Alt>d"

# Delete unused keybindings
declare -a arr=(
    "switch-applications-backward"
    "switch-to-workspace-right"
    "switch-to-workspace-last"
    "switch-to-workspace-left"
    "cycle-windows-backward"
    "move-to-workspace-last"
    "switch-panels-backward"
    "cycle-panels-backward"
    "move-to-monitor-right"
    "switch-to-workspace-1"
    "activate-window-menu"
    "cycle-group-backward"
    "move-to-monitor-down"
    "move-to-monitor-left"
    "move-to-workspace-1"
    "switch-applications"
    "move-to-monitor-up"
    "panel-run-dialog"
    "toggle-maximized"
    "panel-main-menu"
    "cycle-windows"
    "switch-panels"
    "begin-resize"
    "cycle-panels"
    "show-desktop"
    "cycle-group"
    "begin-move"
    "unmaximize"
    "maximize"
    "minimize"
    "close"
)

for i in "${arr[@]}"; do
    gsettings set org.gnome.desktop.wm.keybindings "$i" "[]"
done

# Terminal Themes
# NOTE: Requires new profile saved in gnome-terminal (not "Unnamed" default)
wget -O gogh https://git.io/vQgMr
chmod +x gogh
./gogh
rm ./gogh

# Add startup applications
# - SSH Key Agent
# - Telegram
# - Spotify
# - InSync
# - Slack
# - Guake
