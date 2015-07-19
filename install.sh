#!/bin/bash

# Installs everything for neovim and compiles YouCompleteMe
#

cd ~
git clone https://github.com/korken89/nvim.git ~/.nvim
ln -s ~/.nvim/nvimrc ~/.nvimrc
cd ~/.nvim
git submodule update --init --recursive

# Get CLang
sudo pacman -S astyle ctags clang --needed

# Compile YouCompleteMe
cd ~/.nvim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang

# Example to add new submodules
#
# git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
# git commit -m "Install Fugitive.vim bundle as a submodule."
#
