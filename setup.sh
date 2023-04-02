#!/bin/bash

apt install wget -y

# adding the repo in the pushd

pushd .
cd ~

# installing neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb

apt install ./nvim-linux64.deb

chown -Rv _apt:root ~/nvim-linux64.deb

chmod -Rv 700 ~/nvim-linux64.deb

apt install ./nvim-linux64.deb

# developing the nvim config now
mkdir -p ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
git clone https://luajit.org/git/luajit.git
cd luajit/

# Building luajit
make && make install