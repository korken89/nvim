#!/bin/bash

# Installs everything for neovim and compiles YouCompleteMe
#

# Get GIT
sudo pacman -S git --needed --noconfirm

# Get the repo
cd ~
rm -f ~/.nvimrc
mkdir -p ~/.nvim
git clone https://github.com/korken89/nvim.git ~/.nvim
ln -s ~/.nvim/nvimrc ~/.nvimrc
cd ~/.nvim
git submodule update --init --recursive

# Get dependencies
yaourt -S python2-trollius --needed --noconfirm
yaourt -S neovim-git python2-neovim neovim-symlinks --needed --noconfirm

# Get CLang
sudo pacman -S astyle ctags clang --needed --noconfirm

# Compile YouCompleteMe
cd ~/.nvim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang

# Example to add new submodules
#
# git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
# git commit -m "Install Fugitive.vim bundle as a submodule."
#
