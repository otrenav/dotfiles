
# Before this repo can be cloned, copy ssh keys to ~/.ssh,
# chmod them to 600, and add them to keyring with ssh-add [key]

# Apps to be installed from Ubuntu Software
# - Telegram
# - Postman
# - Spotify
# - Slack
# - Gimp
# - Zoom
# - VLC

sudo apt update
sudo apt upgrade -y

firefox https://www.google.com/intl/en_us/chrome/ &

sudo apt install -y emacs zsh guake cpufrequtils gnome-tweaks ffmpeg xclip \
     gnome-shell-extension-prefs flameshot tmux aptitude npm lsb-release \
     shellcheck ripgrep silversearcher-ag fd-find jq cmake most gnupg \
     simplescreenrecorder curl software-properties-common libssl-dev \
     apt-transport-https ca-certificates tree chrome-gnome-shell meld


sudo snap install authy telegram-desktop slack spotify gimp zoom-client vlc
echo snap >> ~/.hidden

# Python
sudo apt install -y python3-pip python3-dev python3-venv virtualenv
sudo apt install python3-jedi python3-flake8 python3-ipython python3-epc python3-pygments
sudo pip install --break-system-packages black

# Ubuntu 20 doesn't have python: link py3 to py2
sudo rm -rf /usr/bin/python
sudo ln -s /usr/bin/python3 /usr/bin/python

# Git
sudo add-apt-repository ppa:git-core/ppa
rm -rf ~/.gitconfig
ln -s ~/code/system/dotfiles/git/gitconfig ~/.gitconfig

# Fonts: Roboto, Roboto Mono
google-chrome https://fonts.google.com/ &

# Zsh
rm -rf ~/.oh-my-zsh ~/.zshrc
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

mkdir -p ~/.oh-my-zsh/custom/themes
curl https://raw.githubusercontent.com/fjpalacios/elessar-theme/master/elessar.zsh-theme -L -o ~/.oh-my-zsh/custom/themes/elessar.zsh-theme
ln -s ~/code/system/dotfiles/zsh/zshrc ~/.zshrc
chsh -s $(which zsh)

# R
# sudo apt install -y r-base gfortran
# rm -rf ~/.Rprofile
# ln -s ~/code/system/dotfiles/r/Rprofile ~/.Rprofile
# rm -rf ~/.r-lang-packages
# mkdir ~/.r-lang-packages
# Rscript ~/code/system/dotfiles/r/base_packages.R

# JavaScript / NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.zshrc
nvm_load
nvm install 18
nvm alias default 18
npm install -g tern js-beautify eslint jshint typescript typescript-formatter \
csslint jsonlint prettier
rm -rf ~/.jsbeautifyrc
ln -s ~/code/system/dotfiles/js/jsbeautifyrc ~/.jsbeautifyrc

# Emacs
rm -rf ~/code/system/spacemacs
git clone git@gitlab.com:otrenav/spacemacs.git ~/code/system/spacemacs
source ~/code/system/spacemacs/install.sh

# Docker
# sudo apt remove docker docker.io containerd runc
# sudo apt update
# sudo mkdir -p /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# echo \
#     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt update
# sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# sudo usermod -aG docker ${USER}
# sudo systemctl stop docker.service
# sudo systemctl stop docker.socket
# sudo systemctl disable docker.service
# sudo systemctl disable docker.socket

# Fuzzy Finder
ln -s ~/code/system/dotfiles/fzf/fdignore ~/.fdignore
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Tmux
rm -rf ~/.tmux/
rm -rf ~/.tmux.conf
mkdir -p ~/.tmux/
ln -s ~/code/system/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Google Cloud
sudo rm -f /etc/apt/sources.list.d/google-cloud-sdk.list*
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update
sudo apt install -y google-cloud-sdk
$(gcloud info --format="value(basic.python_location)") -m pip install numpy

# Ubuntu Dock
# NOTE: In Ubuntu 19.10+ the dock and desktop icons are very annoying
# and can't be disabled, so we make their extensions unreachable.
# Desktop icons must be disabled in the "Extensions" app
sudo mv /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com/ /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com.backup/

# Apps that require manual installation
mkdir ~/apps
google-chrome https://www.insynchq.com/downloads &

# Apps installed through gnome-extensions
google-chrome https://extensions.gnome.org/extension/3010/system-monitor-next/ &
google-chrome https://extensions.gnome.org/extension/600/launch-new-instance/ &
google-chrome https://extensions.gnome.org/extension/4144/vertical-overview/ &
google-chrome https://extensions.gnome.org/extension/28/gtile/ &
# Gtile: config for 3x1 3-cycle: 3x1 1:1 1:1, 2:1 2:1, 3:1 3:1 (CTRL + ALT + RIGHT)
# Gtile: config for 3x2 2-cycle 3x1 3x1 1:1 2:1, 2:1 3:1 (SHIFT + ALT + RIGHT)

# Required by Gnome Extension: System Monitor
sudo apt install -y gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0

# Disable printing service
# sudo systemctl stop cups.service cups.socket cups.path cups-browsed.service
# sudo systemctl disable cups.service cups.socket cups.path cups-browsed.service

# Disable animations
gsettings set org.gnome.desktop.interface enable-animations false

# Add new keybindings
gsettings set org.gnome.desktop.wm.keybindings close "['<Primary>q']"
gsettings set org.gnome.desktop.wm.keybindings switch-group "['<Super>grave']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Primary><Shift>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Primary><Shift>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward "['<Shift><Super>grave']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Primary>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Primary>Up']"

gsettings set org.gnome.gnome-screenshot auto-save-directory "/home/otrenav"
gsettings set org.gnome.shell.keybindings screenshot "['<Primary><Shift>F9']"
gsettings set org.gnome.shell.keybindings screenshot-window "['<Primary>F9']"
gsettings set org.gnome.settings-daemon.plugins.media-keys previous "['F10']"
gsettings set org.gnome.settings-daemon.plugins.media-keys next "['F11']"
gsettings set org.gnome.settings-daemon.plugins.media-keys play "['F12']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['Pause']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "['Scroll_Lock']"
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute "['Print']"

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

# Screenshot
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name "Screenshot"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "flameshot gui -p /home/otrenav"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding "['F9']"

# Delete unused keybindings
declare -a arr=(
    "magnifier-zoom-out"
    "magnifier-zoom-in"
    "screenreader"
    "screensaver"
    "magnifier"
    "logout"
)
for i in "${arr[@]}"; do
    gsettings set org.gnome.settings-daemon.plugins.media-keys "$i" "[]"
done

declare -a arr=(
    "show-screen-recording-ui"
    "show-screenshot-ui"
    "toggle-overview"
)
for i in "${arr[@]}"; do
    gsettings set org.gnome.shell.keybindings "$i" "[]"
done

declare -a arr=(
    "switch-applications-backward"
    "switch-input-source-backward"
    "switch-to-workspace-right"
    "switch-to-workspace-last"
    "switch-to-workspace-left"
    "cycle-windows-backward"
    "move-to-workspace-last"
    "move-to-workspace-left"
    "move-to-workspace-right"
    "switch-panels-backward"
    "cycle-panels-backward"
    "move-to-monitor-right"
    "switch-to-workspace-1"
    "activate-window-menu"
    "cycle-group-backward"
    "move-to-monitor-down"
    "move-to-monitor-left"
    "switch-input-source"
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

# Do not auto-change brightness based on light environment
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled "false"

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

guake --restore-preferences=./guake/guake.cfg

dconf write /apps/guake/general/save-tabs-when-changed "'false'"
dconf write /apps/guake/general/restore-tabs-startups "'false'"
dconf write /apps/guake/general/gtk-prefer-dark-theme "'true'"
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

dconf write /apps/guake/keybindings/global/show-hide "'<Alt>backslash'"
dconf write /apps/guake/keybindings/local/rename-current-tab "'<Primary><Shift>r'"
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
sudo rm ~/.config/user-dirs.dirs
cp ~/code/system/dotfiles/nautilus/user-dirs.dirs ~/.config/user-dirs.dirs

# Terminal Themes
# NOTE: Requires new profile saved in gnome-terminal (not "Unnamed" default)
wget -O gogh https://git.io/vQgMr
chmod +x gogh
./gogh
rm ./gogh

# Citrix
# 1. Install (sudo dpkg -i ica...)
google-chrome https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html &
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
# - mllabs
# - code
# - knowledge
# - 3-vrs-prod
# - 3-vrs-prod
# - 4-vrs-iot
# - hs
# - hs
# - alpha
# - alpha
# - [month receipts]
# - shared

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
# - Remove C-W and C-Q shortcuts
# - Login with X11/Xorg session

# Manually set the system-monitor config to "digits"
# Verify `running_services` are fine
# Remove from favorites dash all apps
# Remove animations

# If there are PulseAudio issues when recording
# (e.g. 48khz vs 44khz resulting in pitch changes),
# follow these instrucions:
# https://www.maartenbaert.be/simplescreenrecorder/recording-game-audio/
# https://askubuntu.com/questions/371595/for-pulseaudio-what-does-tsched-do-and-what-are-the-defaults
# In summary:
# sudo emacs /etc/pulse/daemon.conf
# - flat-volumes = no
# - default-sample-rate = 48000
# - alterante-sample-rate = 48000
# sudo emacs /etc/puluse/default.pa
# - load-module module-udev-detect tsched=0
