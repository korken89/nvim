#!/bin/bash

# Installs everything for neovim
#

# Get GIT
sudo pacman -S git tk --needed --noconfirm

# Remove old vim
sudo pacman -R vim vi --noconfirm

# Get the repo
cd ~
mkdir -p ~/.config/nvim/autoload
git clone https://github.com/korken89/nvim.git ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Get dependencies
sudo pacman -S neovim python2-trollius python2-neovim python-neovim --needed --noconfirm
yaourt -S otf-inconsolata-powerline-git neovim-symlinks --needed --noconfirm

# Get CLang
sudo pacman -S astyle ctags cmake clang --needed --noconfirm

# Install vim plugins
nvim -c PlugInstall
