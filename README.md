# My vim for python develop

## 命令提要

* `za` 开关折叠
* `zR` 打开所有折叠
* `Ctrl+w + v` 垂直拆分
* `Ctrl+w + s` 水平拆分
* `Ctrl+w + q` 关闭当前窗口
* `Ctrl+w + w` 切换窗口
* `Ctrl+w + k` 切换到上边窗口
* `Ctrl+w + j` 切换到下边窗口
* `Ctrl+w + h` 切换到左边窗口
* `Ctrl+w + l` 切换到右边窗口
* `<leader>td` 打开任务列表
* `<leader>g` 打开历史版本
* `<leader>8` 进行 Pep8 自动修复
* `<leader>k` 查看文档
* `:e <filename>` 打开新的文件
* `:b<number>`    切换到第 <number> 个缓冲区
* `:bn`           切换到下一个缓冲区
* `:bd` 或 `:bw`  关闭当前缓冲区
* `<leader>n` 打开文件树
* `<leader>a` 显示搜索命令
* `<leader>r` 运行 python 程序
* `<leader>j` 转到定义位置

## 初始化

安装 pathogen:

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

初始化 git:

    cd ~/.vim/
    git init

在 ~/.vimrc 中加入以下内容：

    " Pathogen load
    execute pathogen#infect()

安装软件:

    sudo pip install pep8
    sudo apt-get install ack-grep

安装插件:

    git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
    git submodule add https://github.com/tpope/vim-surround.git bundle/surround
    git submodule add https://github.com/ervandew/supertab.git bundle/supertab
    git submodule add https://github.com/fholgado/minibufexpl.vim.git bundle/minibufexpl
    git submodule add https://github.com/wincent/Command-T.git bundle/command-t
    git submodule add https://github.com/mitechie/pyflakes-pathogen.git
    git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
    git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
    git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
    git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
    git submodule add https://github.com/klen/python-mode.git bundle/pythonmode
    git submodule add https://github.com/vim-scripts/taglist.vim.git bundle/taglist
    git submodule init
    git submodule update
    git submodule foreach git submodule init
    git submodule foreach git submodule update

## 维护方法

增加 submodule

    git submodule add https://github.com/klen/python-mode.git bundle/pythonmode

删除 submodule

    git rm --cache bundle/pep8
    rm -rf bundle/pep8
    del contene in .gitmodules

## 使用说明

### 代码折叠

* `za` 开关折叠
* `zR` 打开所有折叠

在 ~/.vimrc 中加入以下内容：

    " code folding
    set foldmethod=indent
    set foldlevel=99

### 拆分窗口

* `Ctrl+w + v` 垂直拆分
* `Ctrl+w + s` 水平拆分
* `Ctrl+w + q` 关闭当前窗口
* `Ctrl+w + w` 切换窗口
* `Ctrl+w + k` 切换到上边窗口
* `Ctrl+w + j` 切换到下边窗口
* `Ctrl+w + h` 切换到左边窗口
* `Ctrl+w + l` 切换到右边窗口

在窗口之间移动原来使用 `Ctrl+w + <movement>` ，现改为 `Ctrl+<movement>` 。
在 ~/.vimrc 中加入以下内容：

    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h

### 代码片断

插件 snipmate 提供了插入代码片断功能。

例如键入 `def<tab>` ，就会看到插入了预定义的代码片断。

定义自己的代码片断：

    $ mkdir ~/.vim/snippets
    $ vim ~/.vim/snippets/python.snippets

在文件中输入如下内容：

    snippet pdb
        import pdb; pdb.set_trace()

现在如果输入 `pdb<tab>` ，就可以看到效果。

### 任务列表

* `<leader>td` 打开任务列表
* `q`           关闭任务列表
* 回车          跳到文件相应内容

插件 tasklist 提供了任务列表功能，可以查看所有打开的文件中含有 `FIXME` 、
`TODO` 和 `XXX` 字样的行。

在 ~/.vimrc 中加入以下内容：

    map <leader>td <Plug>TaskList

### 历史版本

`<leader>g` 打开历史版本

插件 Gundo 提供了历史版本功能。

在 ~/.vimrc 中加入以下内容：

    map <leader>g :GundoToggle<CR>

### 语法高亮

在 ~/.vimrc 中加入以下内容以开启语法高亮：

    syntax on                    " syntax highlighing
    filetype on                  " try to detect filetypes
    filetype plugin indent on    " enable loading indent file for filetype

### 语法检查

设置 pyflakes 不使用 quickfix 窗口：

    let g:pyflakes_use_quickfix = 0

### Pep8 语法自动修复

`<leader>8` 进行 Pep8 自动修复

插件 python-mode 提供了 pep8 检查功能。

在 ~/.vimrc 中加入以下内容：

    map <leader>8 :PymodeLintAuto<CR>

### Tab 补全

在 ~/.vimrc 中加入以下内容：

    au FileType python set omnifunc=pythoncomplete#Complete
    let g:SuperTabDefaultCompletionType = "context"

### python 文档查看

`<leader>K` 查看文档

插件 python-mode 提供了查看文档功能。

### 缓冲区

* `:e <filename>` 打开新的文件
* `:b<number>`    切换到第 <number> 个缓冲区
* `:bn`           切换到下一个缓冲区
* `:bd` 或 `:bw`  关闭当前缓冲区

minibufexpl 插件带来了更好的缓冲区管理功能。

### 文件树

`<leader>n` 打开文件树

插件 NERD Tree 提供了文件树检查功能。

在 ~/.vimrc 中加入以下内容：

    map <leader>n :NERDTreeToggle<CR>

### 搜索

`<leader>a` 显示搜索命令

插件 ack 提供了强大的查询功能。在 ~/.vimrc 中加入以下内容：

    nmap <leader>a <Esc>:Ack!

末尾的感叹号表示只显示命令，不立即执行。
