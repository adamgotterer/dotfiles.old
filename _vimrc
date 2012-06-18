filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
set nocompatible            " don't be compatible with vi
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well

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

"PHP tabs
au FileType php setlocal tabstop=4
au FileType php setlocal shiftwidth=4
au FileType php setlocal softtabstop=4
au FileType php setlocal noexpandtab

"Ruby setup
au FileType ruby setlocal  ic " Case insensitive search
au FileType ruby setlocal  hls " Highlight search
au FileType ruby setlocal  showmatch " Show matching brackets
au FileType ruby setlocal  expandtab
au FileType ruby setlocal  autoindent
au FileType ruby setlocal tabstop=2
au FileType ruby setlocal shiftwidth=2
au FileType ruby setlocal softtabstop=2


" Bind capital W to write
command! W :w

" Sudo write
cmap W! w !sudo tee % >/dev/null

