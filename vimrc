"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" break line
set textwidth=78
set formatoptions=q2mBl
vmap ff gq

" Use spaces instead of tabs
" set expandtab

"
syntax on

" enable 256-color within gnome-terminal
if $COLORTERM=="gnome-terminal"
	set t_Co=256 
	colorscheme leo 
else
	colorscheme ron
endif

" highlight current line and column
set cursorline
set cursorcolumn

" for gVim
if has("gui_running")
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
endif

" command line
set wildmenu

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" indent
set smartindent
set autoindent
set cindent

" fold
"set foldmethod=syntax
set foldmethod=syntax
" 0/1/99
set foldlevelstart=1

" charsets for vim to detect 
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8	

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Auto read when a file is changed outside
set autoread

" Common features
set ruler
set number
set ignorecase

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set noshowmatch

" set color for the matched parentheses
hi MatchParen ctermbg=white

" highlight current window status line
" current sub-window's statusline
hi StatusLine ctermbg=red ctermfg=white
" no current sub-windows's statusline
hi StatusLineNC ctermbg=red ctermfg=green

" How many tenths of a second to blink when matching brackets
set mat=4

" highlight current line
"set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For MiniBufExplorer plugin to navigate between opened files
source ~/.vim/plugin/minibufexpl.vim
"map <Leader>ob :MiniBufExplorer<CR>
"map <Leader>cb :CMiniBufExplorer<CR>
"map <Leader>ub :UMiniBufExplorer<CR>
map <Leader>bb :TMiniBufExplorer<CR>
"
"let g:miniBufExplSplitToEdge=0
"let g:miniBufExplVSplit=20
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplmapCTabSwitchWindows=1
hi MBENormal ctermbg=black ctermfg=yellow
hi MBEChanged ctermbg=red ctermfg=yellow
hi MBEVisibleNormal ctermbg=black ctermfg=green
hi MBEVisibleChanged ctermbg=red ctermfg=green
let g:miniBufExplForceSyntaxEnable=1
"let g:miniBufExplExplorerDebugMode=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For NerdTree plugin to browser filesystem
"map <Leader>ot :NERDTree<CR>
"map <Leader>ct :NERDTreeClose<CR>
map <Leader>tt :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AutoCompletePlugin configure
" disable autostart of acp plugin for speed
" lines>1000,the speed will be affected obviously
let g:acp_enableAtStartup=1
let g:acp_mappingDriven=0
" enable ignore case-insensitive
let g:acp_ignorecaseOption=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable AutoCompletePlugin for snipMate plugin
let g:acp_behaviorSnipmateLength=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configuration for Ctags and Tlist

" open or close Tlist plugin
map <Leader>ll :TlistToggle<CR>
" update tags within project directory
"map <Leader>tu :!/usr/bin/ctags -R .<CR>
map <Leader>uu :!/usr/bin/ctags --C-kinds=+dfglm --language-force=C -R .<CR>

" go back
map <C-\> <C-t>

" tags in use
" for current directory
set tags+=./tags;

" for headers
set tags+=/usr/include/tags

" for kernel
set tags+=/usr/src/linux-headers-3.2.0-38-generic/tags

" for glibc
set tags+=/usr/local/glibc-2.18/tags;

" for qt
set tags+=/usr/local/Qt4/include/tags;
set tags+=/usr/local/Qt4/src/tags;
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For syntax check
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
" for linux kernel 3.2.0-38-generic
let g:syntastic_c_include_dirs=[ '/usr/include','/usr/local/Qt4/include' ]
"for curses, compiler options
"let g:syntastic_c_compiler_options = '-lncurses'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkeys
" for sh cmd
noremap <silent> <Leader>rr :sh<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
