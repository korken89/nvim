#!/bin/bash

# Installs everything for neovim
#

# Get GIT
sudo pacman -S git tk --needed --noconfirm

# Get the repo
cd ~
mkdir -p ~/.config/nvim/autoload
git clone https://github.com/korken89/nvim.git ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Get dependencies
yaourt -S python2-trollius --needed --noconfirm
yaourt -S neovim python2-neovim --needed --noconfirm
yaourt -S neovim-symlinks --needed --noconfirm

# Get CLang
sudo pacman -S astyle ctags clang --needed --noconfirm

# Install vim plugins
nvim -c PlugInstall
