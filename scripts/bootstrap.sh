#!/bin/bash

KRALOVSTVI=${KRALOVSTVI:-`pwd`}

set -x
set -e

# Allow local non-network connections to Xorg.
#xhost +local:

# Add user to wheel group to allow sudo.
#usermod -a -G wheel `whoami`

# Upgrade the system
# sudo dnf upgrade

# Install wine
yum repolist | grep codeready-builder || sudo subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms
rpm -q epel-release || {
    sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
}


# TODO(jhenner) Find way of distributing private files -- like ssh keys and
# stuff like that.

# To allow installing from rpmfusion.
#sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-27.noarch.rpm

#Install software
< "$KRALOVSTVI/scripts/software" xargs sudo dnf install -y

# Install Oh-My-ZSH
test -e ~/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp .Xdefaults ~jhenner/
cp .Xresources ~jhenner/
cp .gitconfig ~jhenner/


# Install powerline fonts.
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

test -e ~/.vim/bundle || {
    mkdir -p ~.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ln -s kralovstvi/.vimrc ~jhenner/.vimrc
    vim +PluginInstall +qall
}

# Make sure the Microsoft Ergonomic Keyboard 4000 scrolling works.
sudo bash -c 'cat > /etc/udev/hwdb.d/61-keyboard-local.hwdb' <<EOF
# Microsoft Natural Ergonomic Keyboard 4000 - remap zoom in/out to page up/down
evdev:input:b0003v045Ep00DB*
 KEYBOARD_KEY_c022d=pageup
 KEYBOARD_KEY_c022e=pagedown
EOF
sudo udevadm hwdb --update
sudo udevadm control --reload

[ -e /snap ] || sudo ln -s /var/lib/snapd/snap /snap
sudo snap install signal-desktop

sudo cp scripts/profile.d/pycharm.sh /etc/profile.d/
set +x
echo
echo
echo '================================================================='
echo 'Please download pycharm and extract it and create a link like so:'
echo '# cd /opt && ln -s pycharm-community-2020.3.3 pycharm'
echo '================================================================='
echo
set -x
