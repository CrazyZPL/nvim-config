#!/bin/bash

echo "-----------------Start init this server----------------"
git clone https://github.com/CrazyZPL/nvim-config.git
mv nvim-config .config

echo "Start setup node"
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install nodejs -y
echo "---------------------End setup node---------------------"

echo "----------------------Start setup neovim-----------------"
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt-get update -y
sudo apt-get install neovim -y
echo "------------------------End setup neovim-----------------------"

echo "----------------------Start setup Packer-----------------------"
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "---------------------End setup Packer--------------------"

echo "--------------------Start setup treesitter-------------------"
wget https://hub.fastgit.org/tree-sitter/tree-sitter/releases/download/v0.20.1/tree-sitter-linux-x64.gz
gzip -d  tree-sitter-linux-x64.gz
mv tree-sitter-linux-x64 /bin/tree-sitter
chmod +x /bin/tree-sitter
echo "--------------------End setup treesitter---------------------"

echo "------------------start setup gcc&g++-----------------------"
apt install gcc g++ -y
apt install unzip -y
echo "------------------end setup gcc&g++------------------------"

echo "------------------Start setup Golang------------------------"
wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
echo "export PATH=/usr/local/go/bin:$PATH" >> ~/.bashrc
echo "--------------------End setup Golang------------------------"
