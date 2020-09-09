
# Before this repo can be cloned, copy ssh keys to ~/.ssh,
# chmod them to 600, and add them to keyring with ssh-add [key]

# Update
sudo apt update -y
sudo apt upgrade -y

firefox https://www.google.com/intl/en_us/chrome/

# Generics
sudo apt install -y cpufrequtils gnome-tweak-tool dconf-cli transmission ffmpeg audacity simplescreenrecorder emacs guake meld curl software-properties-common aspell libssl-dev libcurl4-openssl-dev shellcheck ripgrep cmake mono-devel most fd-find jq zsh apt-transport-https ca-certificates obs-studio inkscape silversearcher-ag

# Ubuntu 20 doesn't have python: link py3 to py2
sudo rm -rf /usr/bin/python
sudo ln -s /usr/bin/python3 /usr/bin/python

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
snap install authy --beta
echo snap >> ~/.hidden

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install -y yarn

# Zsh
ln -s ~/projects/system/dotfiles/scripts ~/.scripts
rm -rf ~/.oh-my-zsh ~/.zshrc
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

mkdir -p ~/.oh-my-zsh/custom/themes
curl https://raw.githubusercontent.com/fjpalacios/elessar-theme/master/elessar.zsh-theme -L -o ~/.oh-my-zsh/custom/themes/elessar.zsh-theme
ln -s ~/projects/system/dotfiles/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)

# SQL Databases
sudo apt install -y mysql-client mysql-server libmysqlclient-dev

# Python
sudo apt install -y python3-pip python3-dev python3-pip python3-venv virtualenv yapf3
sudo pip3 install autoflake hy jedi radon flake8 ipython importmagic epc black flake8 autoflake hy jedi radon flake8 ipython importmagic epc isort pyopenssl ipython autoflake hy jedi radon flake8 ipython importmagic epc virtualenvwrapper pygments
rm -rf ~/.flake8rc ~/.pylintrc
ln -s ~/projects/system/dotfiles/python/isort.cfg ~/.isort.cfg
ln -s ~/projects/system/dotfiles/python/flake8 ~/.flake8rc

# R
sudo apt install libxml2-dev
rm -f /etc/apt/sources.list.d/r.list
echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" | sudo tee -a /etc/apt/sources.list.d/r.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo apt update
sudo apt install -y r-base gfortran
rm -rf ~/.Rprofile
ln -s ~/projects/system/dotfiles/r/Rprofile ~/.Rprofile
rm -rf ~/.r-lang-packages
mkdir ~/.r-lang-packages
Rscript ~/projects/system/dotfiles/r/base_packages.R

# JavaScript/NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
source ~/.zshrc
load_nvm
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
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
sudo systemctl stop docker.service docker.socket
sudo systemctl disable docker.service docker.service

# Fuzzy finder for terminal
ln -s ~/projects/system/dotfiles/fzf/fdignore ~/.fdignore
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Tmux
rm -rf ~/.tmux/
mkdir -p ~/.tmux/
ln -s ~/projects/system/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/projects/system/dotfiles/tmux/scripts ~/.tmux/scripts

# Vim
sudo apt install -y vim
rm -rf ~/.vim
ln -s ~/projects/system/dotfiles/vim ~/.vim
mkdir -p ~/.vim/pack/minpac/opt/
git clone https://github.com/k-takata/minpact.git ~/.vim/pack/minpac/opt/minpac

# Kubectx
git clone https://github.com/ahmetb/kubectx/ ~/.kubectx
ln -s ~/.kubectx/kubectx
ln -s ~/.kubectx/kubens

# Google Cloud (GCP)
rm -f /etc/apt/sources.list.d/google-cloud-sdk.list
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

# Apps that require manual installation
mkdir ~/apps
google-chrome https://www.insynchq.com/downloads &
google-chrome https://zoom.us/download?os=linux &
google-chrome https://desktop.telegram.org/ &

# Apps installed through gnome-extensions
google-chrome https://extensions.gnome.org/extension/600/launch-new-instance/ &
google-chrome https://extensions.gnome.org/extension/120/system-monitor/ &
google-chrome https://extensions.gnome.org/extension/28/gtile/ &

# Required by Gnome Extension: System Monitor
sudo apt install gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0

# Ubuntu Dock
# NOTE: In Ubuntu 19.10 the dock and desktop icons are very annoying
# and can't be disabled, so we make their extensions unreachable
sudo mv /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com/ /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com.backup/
sudo mv /usr/share/gnome-shell/extensions/desktop-icons@csoriano/ /usr/share/gnome-shell/extensions/desktop-icons@csoriano.backup/

# Disable printing service
sudo systemctl stop cups.service cups.socket cups.path cups-browsed.service
sudo systemctl disable cups.service cups.socket cups.path cups-browsed.service

# Remove unnecessary software
sudo apt remove -y gnome-shell-extension-desktop-icons thunderbird rhythmbox

# Add new keybindings
gsettings set org.gnome.desktop.wm.keybindings close "['<Primary>q']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>grave']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Primary><Shift>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Primary><Shift>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Primary>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Primary>Up']"

gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot "['<Primary><Shift>F9']"
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot "['<Primary>F9']"
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot "['F9']"
gsettings set org.gnome.settings-daemon.plugins.media-keys previous "['<Primary>F10']"
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['<Primary>F11']"
gsettings set org.gnome.settings-daemon.plugins.media-keys play "['<Primary>F12']"

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
    "window-screenshot-clip"
    "area-screenshot-clip"
    "magnifier-zoom-out"
    "magnifier-zoom-in"
    "screenshot-clip"
    "screenreader"
    "screensaver"
    "screencast"
    "magnifier"
    "logout"
)
for i in "${arr[@]}"; do
    gsettings set org.gnome.settings-daemon.plugins.media-keys "$i" "[]"
done

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
)
for i in "${arr[@]}"; do
    gsettings set org.gnome.desktop.wm.keybindings "$i" "[]"
done

# Interface
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Roboto Medium 12"
gsettings set org.gnome.desktop.interface monospace-font-name "Roboto Mono Medium 14"
gsettings set org.gnome.desktop.interface document-font-name "Roboto Medium 12"
gsettings set org.gnome.desktop.interface gtk-im-module "gtk-im-context-simple"
gsettings set org.gnome.desktop.interface font-name "Roboto Medium 12"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-dark"
gsettings set org.gnome.desktop.interface clock-format "12h"

gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled "true"
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled "false"
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll "false"

gsettings set org.gnome.system.location enabled "false"

dconf write /apps/guake/general/save-tabs-when-changed "'true'"
dconf write /apps/guake/general/gtk-prefer-dark-theme "'true'"
dconf write /apps/guake/general/restore-tabs-startups "'true'"
dconf write /apps/guake/style/background/transparency "100"
dconf write /apps/guake/general/restore-tabs-notify "'false'"
dconf write /apps/guake/general/gtk-theme-name "'Yaru-dark'"
dconf write /apps/guake/general/use-audible-bell "'false'"
dconf write /apps/guake/general/start-fullscreen "'true'"
dconf write /apps/guake/general/use-default-font "'true'"
dconf write /apps/guake/general/window-losefocus "'true'"
dconf write /apps/guake/general/window-refocus "'false'"
dconf write /apps/guake/general/start-at-login "'true'"
dconf write /apps/guake/general/window-halignment "0"
dconf write /apps/guake/general/use-trayicon "'false'"
dconf write /apps/guake/general/window-height "100"
dconf write /apps/guake/general/window-tabbar "'true'"
dconf write /apps/guake/general/window-width "100"
dconf write /apps/guake/general/use-popup "'false'"

dconf write /apps/guake/keybindings/local/rename-current-tab "'<Primary><Shift>r'"
dconf write /apps/guake/keybindings/global/show-hide "'<Primary><Alt>backslash'"
dconf write /apps/guake/keybindings/local/toggle-hide-on-lose-focus "'disabled'"
dconf write /apps/guake/keybindings/local/decrease-transparency "'disabled'"
dconf write /apps/guake/keybindings/local/increase-transparency "'disabled'"
dconf write /apps/guake/keybindings/local/focus-terminal-right "'disabled'"
dconf write /apps/guake/keybindings/local/split-tab-horizontal "'disabled'"
dconf write /apps/guake/keybindings/local/focus-terminal-down "'disabled'"
dconf write /apps/guake/keybindings/local/focus-terminal-left "'disabled'"
dconf write /apps/guake/keybindings/local/toggle-transparency "'disabled'"
dconf write /apps/guake/keybindings/local/move-tab-right "'<Shift>Right'"
dconf write /apps/guake/keybindings/local/split-tab-vertical "'disabled'"
dconf write /apps/guake/keybindings/local/focus-terminal-up "'disabled'"
dconf write /apps/guake/keybindings/local/previous-tab "'<Primary>Left'"
dconf write /apps/guake/keybindings/local/toggle-fullscreen "'disabled'"
dconf write /apps/guake/keybindings/local/move-tab-left "'<Shift>Left'"
dconf write /apps/guake/keybindings/local/decrease-height "'disabled'"
dconf write /apps/guake/keybindings/local/increase-height "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab-last "'disabled'"
dconf write /apps/guake/keybindings/local/close-terminal "'disabled'"
dconf write /apps/guake/keybindings/local/next-tab "'<Primary>Right'"
dconf write /apps/guake/keybindings/local/new-tab-home "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab10 "'disabled'"
dconf write /apps/guake/keybindings/local/close-tab "'<Primary>w'"
dconf write /apps/guake/keybindings/local/switch-tab1 "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab2 "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab3 "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab4 "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab5 "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab6 "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab7 "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab8 "'disabled'"
dconf write /apps/guake/keybindings/local/switch-tab9 "'disabled'"
dconf write /apps/guake/keybindings/local/new-tab "'<Primary>t'"
dconf write /apps/guake/keybindings/local/quit "'<Primary>q'"

# Remove unnecessary packages
sudo apt autoremove

# Overwrite user dirs
rm ~/.config/user-dirs.dirs
cp ~/projects/system/dotfiles/nautilus/user-dirs.dirs ~/.config/user-dirs.dirs

# Terminal Themes
# NOTE: Requires new profile saved in gnome-terminal (not "Unnamed" default)
wget -O gogh https://git.io/vQgMr
chmod +x gogh
./gogh
rm ./gogh

# Manually add startup applications
# - SSH Key Agent
# - Telegram
# - Spotify
# - InSync
# - Slack
# - Guake

# Manually add nautilus favories
# - shared
# - [month receipts]
# - knowledge
# - videos
# - work
# - personal
# - projects
# - downloads

# Manually sign-in to Chrome extensions
# - Grammarly
# - Calendly

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

# Manually set the system-monitor config to "digits"

# Remove from favorites dash all apps

# Verify `running_services` are fine
