cp kglobalshortcutsrc ~/.config/kglobalshortcutsrc
cp kdeglobals ~/.config/kdeglobals
cp kwinrc ~/.config/kwinrc

# remove apps
sudo dnf remove -y firefox 

# Install apps
# Basic apps
sudo dnf install -y vim

# required adicional repo
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable jdxcode/mise

# local development tools
sudo dnf install -y  ghostty mise 
cp ghostty-config ~/.config/ghostty/config

# required for mise to install ruby
sudo dnf install -y libyaml libyaml-devel

# Install mise
# todo (Add mise installation)

# Install ruby versions
mise use -g ruby@3.3.7
mise use -g node

# Personal applications

# open code
command -v opencode >/dev/null 2>&1 || curl -fsSL https://opencode.ai/install | bash
curl -fsSL https://claude.ai/install.sh | bash


# rclone to sync files to google drive
sudo dnf install -y rclone
rclone config

# rclone config steps
# New remote
# name: drive
# Storage: drive
# Client_id: <blank>
# client_secret: <blank>
# scope: 1 (full access)
# service_account_file: <blank>
# advanced config: No
# use web broser: Yes
# Shared drive: no
# Keep this "drive" remote?: yes

mkdir ~/Drive
(crontab -l 2>/dev/null; echo '*/5 * * * * flock -n /tmp/rclone-bisync.lock /usr/bin/rclone bisync drive: /home/$USER/Drive >> /home/$USER/rclone.log 2>&1') | crontab -

# Install brew
# watchman is required for vscode
brew install watchman

# Gaming // Steam
# https://docs.fedoraproject.org/en-US/gaming/proton/
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf install -y steam

# Discord
flatpak install app/com.discordapp.Discord/x86_64/stable

# Nvidia drivers
# Last time I tried this, spend a whole day fixing nvidia errors :(
#sudo dnf install akmod-nvidia -y

# Development tools
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update &&
sudo dnf install code # or code-insiders


#configure git
git config --global user.name "lcjury"
git config --global user.email lcjury@gmail.com

# preinstall tools with mise
mise use --global ruby
mise use --global node

# postgres local db
# https://docs.fedoraproject.org/es/quick-docs/postgresql/

sudo dnf install postgresql-server postgresql-contrib
sudo systemctl enable postgresql
sudo postgresql-setup --initdb --unit postgresql
# to start server sudo systemctl start postgresql
echo "to create a user execute sudo -u postgres psql"
echo "postgres=# CREATE USER lenny WITH PASSWORD 'leonard';"
echo "postgres=# CREATE DATABASE my_project OWNER lenny;"
echo "and postgres=# \password postgres for pg password"

# Add common aliases
echo "alias gd='git diff'" >> ~/.bashrc
echo "alias ga='git add'" >> ~/.bashrc
echo "alias gs='git status'" >> ~/.bashrc
source ~/.bashrc

# KDE Jury theme
mkdir -p ~/.local/share/color-schemes
mkdir -p ~/.local/share/aurorae/themes
mkdir -p ~/.local/share/plasma/look-and-feel

cp kde-themes/color-schemes/Jury.colors ~/.local/share/color-schemes/
cp -r kde-themes/aurorae/Jury ~/.local/share/aurorae/themes/
cp -r kde-themes/look-and-feel/Jury ~/.local/share/plasma/look-and-feel/

plasma-apply-colorscheme Jury
plasma-apply-lookandfeel Jury
kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key library org.kde.kwin.aurorae
kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key theme "__aurorae__svg__Jury"

# disable paste on middle click
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

# Adjust swappiness. I have enough ram to decrease it
echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-swappiness.conf

# install brew. It's required to install watchamn, which is required for sorbet vscode plugin
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
