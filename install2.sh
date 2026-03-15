# remove apps
sudo dnf remove firefox gnome-weather gnome-tour

# Change alt+tab switch menu
gsettings set org.gnome.desktop.wm.keybindings switch-applications "@as []"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"

# Install

# local development tools
sudo dnf install ghostty mise 

# required for mise to install ruby
sudo dnf install libyaml libyaml-devel

# Install mise
# todo (Add mise installation)

# Install ruby versions
mise use -g ruby@3.3.7
mise use -g node

# Personal applications

# open code
curl -fsSL https://opencode.ai/install | bash

# rclone to sync files to google drive
sudo dnf install rclone
rclone config

mkdir Drive
(crontab -l 2>/dev/null; echo '*/5 * * * * flock -n /tmp/rclone-bisync.lock /usr/bin/rclone bisync drive: /home/$USER/Drive >> /home/$USER/rclone.log 2>&1') | crontab -

# Install brew
# watchman is required for vscode + 
brew install watchman