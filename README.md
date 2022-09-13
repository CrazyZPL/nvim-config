# Neovim Config
一个根据[dotfiles]("https://github.com/craftzdog/dotfiles-public")改的个人neovim配置。

# 准备工作

## 安装NodeJS
```bash
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install nodejs -y
```

## 安装Neovim
```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

## 安装Packer
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## 安装treesitter
```bash
wget https://hub.fastgit.org/tree-sitter/tree-sitter/releases/download/v0.20.1/tree-sitter-linux-x64.gz

gzip -d  tree-sitter-linux-x64.gz

mv tree-sitter-linux-x64 /bin/tree-sitter

chmod +x /bin/tree-sitter
```

## 安装插件
```bash
nvim init.lua
:PackerInstall
:wqa
```
