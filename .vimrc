set nocompatible              " be iMproved, required
filetype on                  " required
syntax on

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)
"Plug 'gmarik/vundle'
" 替换vundle为vim plug
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required

" The following are examples of different formats supported.
" Keep Plug commands between here and filetype plugin indent on.
" scripts on GitHub repos
" Plug 'scrooloose/syntastic'
" 替换syntastic为ale 异步代码检测
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'oscarh/vimerl'
"Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/cscope.vim' 
Plug 'plasticboy/vim-markdown'
Plug 'hcs42/vim-erlang-tags'
Plug 'rkulla/pydiction'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" python 缩进
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
" python 跳转和补全
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
"Plug 'Valloric/YouCompleteMe'
" Plug 'vim-erlang/vim-erlang-omnicomplete'
" Plug 'Shougo/neocomplete'
Plug 'elixir-lang/vim-elixir'
Plug 'youthy/vimerl-complete'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
" 替换ctrlp
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}

call plug#end()
" scripts from http://vim-scripts.org/vim/scripts.html
" scripts not on GitHub
" Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plug 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList          - list configured plugins
" :PlugInstall(!)    - install (update) plugins
" :PlugSearch(!) foo - search (or refresh cache first) for foo
" :PlugClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plug commands are not allowed.
" Put your stuff after this line

set nu
set hls
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set colorcolumn=81 
"字符编码设置
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set wildignore=*.o,*~,*.pyc,*.beam
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

language message zh_CN.UTF-8

colorscheme peachpuff

" 复制进系统剪切板
vnoremap <C-c> "+y
" 从系统剪切板拷贝
nnoremap cp "+p
" ale 错误跳转
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
" 执行:FZF
nnoremap <C-p> :FZF<cr>
" \ev打开.vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" use :hi to see all highlight
" 清除sign column 背景
highlight clear SignColumn
" 改变ale错误和经警告前景和背景色
highlight ALEErrorSign ctermfg=Red ctermbg=Yellow
highlight ALEWarningSign ctermfg=Yellow ctermbg=White
" neocomplete auto start
"let g:neocomplete#enable_at_startup = 1
" 没有指定文件名时,自动打开nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 只剩下nerdtree时关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir

" jedi跳转
let g:jedi#goto_command = "<C-]>"
" Syntastic 保存时不check, 手动输命令check
let g:syntastic_check_on_wq = 0
" Syntastic 发现错误后立即跳转到错误行
let g:syntastic_auto_jump = 1
" 设置python检查为pep，pep8比pylint宽松,参考:help sysntastic
let g:syntastic_python_checkers = ['pep8']
let g:vim_markdown_no_default_key_mappings=1
" pydiction location设置
let g:pydiction_location = '/home/yuyouqi/.vim/bundle/pydiction/complete-dict'
let g:vimerl_complete_auto = 1
" Ignore compiled files
" UtilSnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:SuperTabDefaultCompletionType="<c-n>"
let g:SuperTabContextDefaultCompletionType="<c-n>"
" ale 语法检查erlang编译参数
let g:ale_erlang_erlc_options="-I include -pa ebin/game "
let g:ale_fix_on_save=1
let g:ale_set_quickfix=1
let g:ale_sign_column_always=1
" 修改ale的sign形状
let g:ale_sign_error='●'
let g:ale_sign_warning='●'
