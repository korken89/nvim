#!/bin/bash

# Installs everything for neovim and compiles YouCompleteMe
#

# Get GIT
sudo pacman -S git tk --needed --noconfirm

# Get the repo
cd ~
mkdir -p ~/.config/nvim
git clone https://github.com/korken89/nvim.git ~/.config/nvim
ln -s ~/.config/nvim/ctags ~/.ctags
cd ~/.config/nvim
git submodule update --init --recursive

# Get dependencies
yaourt -S python2-trollius --needed --noconfirm
yaourt -S neovim-git python2-neovim --needed --noconfirm
yaourt -S neovim-symlinks --needed --noconfirm

# Get CLang
sudo pacman -S astyle ctags clang --needed --noconfirm

# Compile YouCompleteMe
cd ~/.config/nvim/bundle/YouCompleteMe
./install.sh --clang-completer --system-libclang --omnisharp-completer

# Example to add new submodules
#
# git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
# git commit -m "Installed Fugitive.vim bundle as a submodule."
#
