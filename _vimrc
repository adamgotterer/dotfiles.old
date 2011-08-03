filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
set nocompatible
"set autoindent
"set smartindent
"set tabstop=4
"set shiftwidth=4
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set nu
autocmd FileType ruby     setlocal shiftwidth=2 tabstop=2
autocmd FileType html     setlocal shiftwidth=2 tabstop=2
autocmd FileType eruby  setlocal shiftwidth=2 tabstop=2
set backspace=indent,eol,start
set showmatch
set incsearch
set hlsearch
nmap <silent> <leader>n :silent :nohlsearch<CR>
set ignorecase
set smartcase
set virtualedit=all
set bs=2
set hidden
nnoremap ' `
nnoremap ` '
let mapleader = ","
set history=1000
"runtime macros/matchit.vim
set wildmenu
set wildmode=longest,list,full
set scrolloff=3
nnoremap <C-e> 3<C-e>
nnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>
vnoremap <C-y> 3<C-y>
set ruler
syntax on
filetype plugin on
filetype indent on
set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>s :set nolist!<CR>
set visualbell
colorscheme adam
set scrolloff=3
set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>s :set nolist!<CR>
map <F2> :NERDTreeToggle<CR>
:au BufNewFile,BufRead Vagrantfile :set filetype=ruby

au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

"Stores .swp files in a single directory
set directory=~/.vim/swap,.

"delete trailing whitespace on save:
au BufWritePre *.py mark `|:%s/\s\+$//e|normal ``
