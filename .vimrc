" Pathogen load
execute pathogen#infect()
execute pathogen#helptags()

" Code folding
set foldmethod=indent
set foldlevel=99

" Split window
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Task list
map <leader>td <Plug>TaskList

" Revision History
map <leader>g :GundoToggle<CR>

" Syntax highlighting
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
syntax on                    " syntax highlighing

" Validation
let g:pyflakes_use_quickfix = 0

" by plugin python-mode
" turn on python-mode
let g:pymode = 1

" pep8 autofix
map <leader>8 :PymodeLintAuto<CR>

" tab complete
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" file browser
map <leader>n :NERDTreeToggle<CR>

" Refactoring and Go to definition
let g:pymode_run_bind = '<leader>r'
let g:pymode_rope_goto_definition_bind = '<leader>j'

" search
nmap <leader>a <Esc>:Ack!

" auto reload vimrc
" autocmd BufWritePost .vimrc source %

set lines=40 columns=85
set autoindent
set shiftwidth=4
set tabstop=4 
set expandtab 
set nu
set nobackup

"搜索时忽略大小写
set ignorecase

"解决中文字符显示半个的问题
set ambiwidth=double
"""""""""""""""""""""""""""""
"解决windows下的中文乱码问题
"""""""""""""""""""""""""""""
set encoding=utf-8
"set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
    "解决中文菜单乱码
    set langmenu=zh_CN.utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    "解决console输出乱码
    language messages zh_cn.utf-8
    "设置字体
    "取得当前使用的字体：set guifont?
    "如果字体名称中含有空格，需要在空格前面加上一个反斜杠(\)：
    "set guifont=Terminal:h18:b:cANSI
    set guifont=Fixedsys
else
    set fileencoding=utf-8
    set guifont=文泉驿等宽微米黑\ 11
endif

"""""""""""""""""""""""
" 设定 vimdiff 的颜色 "
"""""""""""""""""""""""
if &diff
    set tw=80 columns=180
    " 设定超过的部份会自动换行，适合搭配显示行号使用
    " Add 代表新增的一行， Delete 代表删除的一行，
    " Change 代表有差异的一行，Text 代表有差异的这一行中，具有差异的部份
    hi DiffAdd ctermfg=Grey ctermbg=Blue guifg=Black guibg=LightBlue
    hi DiffDelete ctermfg=Grey ctermbg=Grey guifg=Grey
    hi DiffChange ctermfg=Black ctermbg=DarkGreen guifg=Black guibg=LightGray
    hi DiffText ctermfg=Black ctermbg=Grey guifg=Black guibg=Gray
endif

"""""""""""
" 设定TAG "
"""""""""""
set foldmethod=syntax " 用语法高亮来定义折叠
set foldmethod=indent " 更多的缩进表示更高级别的折叠(这个似乎效果好一些)
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的。
let Tlist_Exit_OnlyWindow = 1 "如果 taglist 窗口是最后一个窗口，则退出 vim。
let Tlist_Auto_Open=1 "自动打开Tlist
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示 taglist 窗口。


