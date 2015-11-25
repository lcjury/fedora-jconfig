#Copy Repositories
sudo cp repositories/* /etc/yum.repos.d/

# rpmfusion repo
#su -c 'dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm'
#su -c 'dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-rawhide.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-rawhide.noarch.rpm'
udo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm

#install programs
sudo dnf install -y gnome-common gtk3-devel gtk2-devel intltool gnome-common tmux nano gcc google-chrome-stable nautilus-dropbox gcc-c++ vim-enhanced git-core unrar gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} ffmpeg vim-enhanced intltool gnome-tweak-tool gtk-murrine-engine transmission

#sudo yum install gstreamer1-libav gstreamer1-plugins-good
#gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer-ffmpeg
#gstreamer-plugins-good gstreamer-plugins-ugly gstreamer-plugins-bad
#gstreamer-plugins-bad-free gstreamer-plugins-bad-nonfree



#configure git
git config --global user.name "lcjury"
git config --global user.email zeui16@gmail.com

#download solarized theme for gnome terminal
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
sh install.sh
cd ..
#delete solarized theme repo
rm -rf gnome-terminal-colors-solarized

#init dropbox
dropbox start -i &

# Set Keyboard Shortcuts Bindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "open-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command gnome-terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Alt><Ctrl>T"

#install alternate tab gnome shell extension
git clone git://git.gnome.org/gnome-shell-extensions
cd gnome-shell-extensions
sh autogen.sh
make
sudo cp -r extensions/alternate-tab /usr/share/gnome-shell/extensions/
cd ../
#delete gnome shell extensions repo
sudo rm -rf gnome-shell-extensions

#Ruby on Rails
sudo dnf install mysql-devel ruby-devel rubygems libxml2-devel libxslt-devel sqlite-devel nodejs rpm-build
gem install rails
gem install sqlite3
gem install heroku

# Vim Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Vim config
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
vim +PluginInstall +qall

#Fonts
dnf install -y google-droid-sans-mono-fonts

#Setting droid sans mono 11 for terminal font
$PROFILE=`dconf read /org/gnome/terminal/legacy/profiles:/default | sed s/^\'// | sed s/\'$//`
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE/font "'Droid Sans Mono 11'"
dconf write /org/gnome/terminal/legacy/profiles:/:$PROFILE/use-system-font false
dconf write /org/gnome/terminal/legacy/default-show-menubar false
#Bash
cp .bashrc ~/.bashrc
cp .git-completion.bash ~/.git-completion.bash
cp .tmux.conf ~/.tmux.conf

#Apache & PHP
sudo dnf install -y httpd php mariadb-server php-mysql phpmyadmin
#Start httpd: systemctl start httpd
#vi /var/www/html/test.php
mysql_secure_installation

# Install ceti 2 theme
git clone https://github.com/horst3180/ceti-2-theme --depth 1 && cd ceti-2-theme
./autogen.sh --prefix=/usr
sudo make install
cd ..
