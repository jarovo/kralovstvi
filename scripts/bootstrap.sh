#!/bin/bash

KRALOVSTVI=${KRALOVSTVI:-`pwd`}

set -x
#set -e

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-27.noarch.rpm
< "$KRALOVSTVI/scripts/software" xargs sudo dnf install -y

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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

mkdir -p .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s kralovstvi/.vimrc ~jhenner/.vimrc
vim +PluginInstall +qall

