# My vim for python develop

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

    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
    git submodule add https://github.com/tpope/vim-surround.git bundle/surround
    git submodule add https://github.com/tpope/vim-git.git bundle/git
    git submodule add https://github.com/ervandew/supertab.git bundle/supertab
    git submodule add https://github.com/fholgado/minibufexpl.vim.git bundle/minibufexpl
    git submodule add https://github.com/wincent/Command-T.git bundle/command-t
    git submodule add https://github.com/mitechie/pyflakes-pathogen.git
    git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
    git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
    git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc
    git submodule add https://github.com/vim-scripts/pep8.git bundle/pep8
    git submodule add https://github.com/alfredodeza/pytest.vim.git bundle/py.test
    git submodule add https://github.com/reinh/vim-makegreen bundle/makegreen
    git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
    git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
    git submodule add https://github.com/klen/python-mode.git bundle/ropevim
    git submodule init
    git submodule update
    git submodule foreach git submodule init
    git submodule foreach git submodule update

## 维护方法

增加 submodule

    git submodule add https://github.com/klen/python-mode.git bundle/ropevim

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

### Pep8 语法检查

`<leader>8` 进行 Pep8 检查

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


Test Integration
django nose

Test runner integration really depends on the testing library you are using and what type of tests you are running but we included a great generic plugin called MakeGreen that executes off of vim’s makeprg variable. So for instance, if you are using django with django-nose you could define a shortcut key in your ~/.vimrc like this:

map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

This will just give you a green bar at the bottom of vim if your test passed or a red bar with the message of the failed test if it doesn’t. Very simple.
py.test

I also included the py.test vim plugin for those who prefer it. This plugin has a lot more functionality including executing individual tests by class, file, or method. You can also cycle through the individual assertion errors. I have the following bindings:

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

http://i.imgur.com/RAE7v.png
Virtualenv

Vim doesn’t realize that you are in a virtualenv so it wont give you code completion for libraries only installed there. Add the following script to your ~/.vimrc to fix it:

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

Django

The only true django tweak I make is before I open vim I’ll export the DJANGO_SETTINGS_MODULE environment so that I get code completion for django modules as well:

export DJANGO_SETTINGS_MODULE=project.settings


