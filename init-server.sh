#!/bin/bash

if test $1=""; then
  echo "You should enter sudo pwd when you exec this script"
  exit 8
fi

admin_pwd=$1
echo "-----------------Start init this server----------------"

if node -v; then
  echo "node is found"
else
  echo "Start setup node"
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  echo $admin_pwd | sudo -S apt-get install nodejs -y
  echo "---------------------End setup node---------------------"
fi

if nvim -v; then
  echo "neovim is found"
else
  echo "----------------------Start setup neovim-----------------"
  echo $admin_pwd | sudo -S add-apt-repository ppa:neovim-ppa/stable -y
  echo $admin_pwd | sudo -S apt-get update -y
  echo $admin_pwd | sudo -S apt-get install neovim -y
  echo "------------------------End setup neovim-----------------------"
fi

echo "----------------------Start setup Packer-----------------------"
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "---------------------End setup Packer--------------------"

echo "--------------------Start setup treesitter-------------------"
wget https://hub.fastgit.org/tree-sitter/tree-sitter/releases/download/v0.20.1/tree-sitter-linux-x64.gz
gzip -d  tree-sitter-linux-x64.gz
echo $admin_pwd | sudo -S mv tree-sitter-linux-x64 /bin/tree-sitter
echo $admin_pwd | sudo -S chmod +x /bin/tree-sitter
echo "--------------------End setup treesitter---------------------"

echo "------------------start setup gcc&g++-----------------------"
echo $admin_pwd | sudo -S apt install gcc g++ -y
echo $admin_pwd | sudo -S apt install unzip -y
echo "------------------end setup gcc&g++------------------------"

if go version; then
  echo "Golang is found"
else
  echo "------------------Start setup Golang------------------------"
  wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
  echo $admin_pwd | sudo -S rm -rf /usr/local/go && echo $admin_pwd | sudo -S tar -C /usr/local -xzf go1.19.1.linux-amd64.tar.gz
  echo "export PATH=/usr/local/go/bin:$PATH" >> ~/.bashrc
  echo "--------------------End setup Golang------------------------"
fi
