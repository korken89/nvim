#!/bin/bash

# Installs everything for neovim and compiles YouCompleteMe
#

cd ~
git clone https://github.com/korken89/nvim.git ~/.nvim
ln -s ~/.nvim/nvimrc ~/.nvimrc
cd ~/.nvim
git submodule update --init --recursive

# Get CLang
sudo pacman -S astyle clang --needed

# Compile YouCompleteMe
cd ~/.nvim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang
