#Copy Repositories
sudo cp repositories/* /etc/yum.repos.d/

# rpmfusion repo
su -c 'dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm'
su -c 'dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-rawhide.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-rawhide.noarch.rpm'

#install programs
sudo dnf install  gnome-common gtk3-devel gtk2-devel intltool gnome-common tmux nano gcc google-chrome-stable nautilus-dropbox gcc-c++ vim-enhanced git-core unrar gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} ffmpeg vim-enhanced intltool

#configure git
git config --global user.name "lcjury"
git config --global user.email zeui16@gmail.com

#download solarized theme for gnome terminal
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
sh install.sh
cd ..
#delete solarized theme repo
sudo rm -rf gnome-terminal-colors-solarized #really don't know why have to use sudo

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
sudo dnf install mysql-devel ruby-devel rubygems libxml2-devel libxslt-devel sqlite-devel nodejs
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
dnf install google-droid-sans-mono-fonts
