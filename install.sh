#Copy Repositories
cp *.repo /etc/yum.repos.d/

# rpmfusion repo
su -c 'dnf localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm'

#update vim-minimal (fedora 20 conflict)
#sudo yum update vim-minimal


#install programs
sudo dnf install gtk3-devel gtk2-devel intltool gnome-common tmux nano gcc google-chrome-stable nautilus-dropbox numix-gtk-theme numix-icon-theme numix-icon-theme-circle gcc-c++ vim-enhanced git-core unrar gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} ffmpeg

#download solarized
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
sh install.sh
cd ..

#vim solarized theme
git clone https://github.com/altercation/vim-colors-solarized.git
mkdir ~/.vim/
mkdir ~/.vim/colors/
cd vim-colors-solarized/colors
mv solarized.vim ~/.vim/colors/
cd ../../

#init dropbox
dropbox start -i &

#put Numix theme
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.wm.preferences theme "Numix"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"

# Set Keyboard Shortcuts Bindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "open-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command gnome-terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Alt><Ctrl>T"

#install gnome-shell-extensions
git clone git://git.gnome.org/gnome-shell-extensions
cd gnome-shell-extensions
sh autogen.sh
make
sudo cp -r extensions/alternate-tab /usr/share/gnome-shell/extensions/
cd ../

#configure git
git config --global user.name "Luis Jury"
git config --global user.email "zeui16@gmail.com"

#Ruby on Rails
sudo dnf install mysql-devel ruby-devel rubygems libxml2-devel libxslt-devel sqlite-devel nodejs
gem install rails
gem install sqlite3
