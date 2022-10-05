# Neovim Config
一个根据[dotfiles](https://github.com/craftzdog/dotfiles-public)改的个人neovim配置。

# 准备工作
目前只需要将仓库clone下来以后切到“*/home/username*”目录下，将仓库名称改成"*.config*"，然后进入到目录中，执行```bash init_server.sh [your admin password]```即可。

脚本执行完毕后，输入命令**nvim**进入编辑器，初次打开可能会遇到一些报错，直接忽略，然后可以看到在安装**treesitter**以及插件中设定好的LSP，待任务全部完成后再次打开检查是否存在报错，如果存在请自行解决

# 一些会用到的命令
进入nvim编辑器内，输入命令```:TSInstallInfo```查看treesitter的parser安装情况；输入命令```:LspInstallInfo```查看LSP安装情况。
