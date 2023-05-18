#!/bin/bash

apt install wget git curl build-essential -y

# adding the repo in the pushd

pushd .
cd ~

# installing neovim
wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
chown -Rv _apt:root ~/nvim-linux64.deb
chmod -Rv 700 ~/nvim-linux64.deb

apt install ./nvim-linux64.deb

# developing the nvim config now
mkdir -p ~/.config/nvim
git clone https://github.com/stavyadatta/lazyVim.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
git clone https://luajit.org/git/luajit.git
cd luajit/

# Building luajit
make && make install

# installing nodejs and npm
cd ~
curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt install -y nodejs

# installing ripgrep
cd ~
apt-get install ripgrep -y

# Fuzzy file finder
apt install fzf -y

# Adding Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin

# going back to same repo
popd
