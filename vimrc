filetype off
set nocompatible            " don't be compatible with vi

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins #########################################
Plugin 'gmarik/vundle'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kevinw/pyflakes-vim'
Plugin 'bling/vim-airline'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'mitechie/pyflakes-pathogen'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/syntastic'
" end Vundle plugins #####################################
call vundle#end()
filetype plugin indent on

set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well

set path=.,,** " Always set the path to the current files directory

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 2

set nu
autocmd FileType ruby     setlocal shiftwidth=2 tabstop=2
autocmd FileType crystal     setlocal shiftwidth=2 tabstop=2
autocmd FileType html     setlocal shiftwidth=2 tabstop=2
autocmd FileType eruby  setlocal shiftwidth=2 tabstop=2
autocmd FileType ghmarkdown  setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
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
set ruler
syntax on
filetype plugin on
filetype indent on
set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>s :set nolist!<CR>
set visualbell
colorscheme Tomorrow-Night-Bright
set scrolloff=3
set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>s :set nolist!<CR>
map <F2> :NERDTreeToggle<CR>
:au BufNewFile,BufRead Vagrantfile :set filetype=ruby
:au BufNewFile,BufRead Gemfile :set filetype=ruby
:au BufNewFile,BufRead *.task :set filetype=ruby

au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

"delete trailing whitespace on save:
"au BufWritePre * mark `|:%s/\s\+$//e|normal ``
autocmd BufWritePre *.py :%s/\s\+$//e

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
"
"Crystal setup
au FileType crystal setlocal  ic " Case insensitive search
au FileType crystal setlocal  hls " Highlight search
au FileType crystal setlocal  showmatch " Show matching brackets
au FileType crystal setlocal  expandtab
au FileType crystal setlocal  autoindent
au FileType crystal setlocal tabstop=2
au FileType crystal setlocal shiftwidth=2
au FileType crystal setlocal softtabstop=2


" Bind capital W to write
command! W :w
"
" Bind capital Q to quit
command! Q :q

" Sudo write
cmap W! w !sudo tee % >/dev/null

"" Disable arrow keys
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

"" Disable the find in manual binding. Super annoying when navigating
""  tmux/splits and accidentally hitting ctrl instead of shift
noremap <S-k> ""

map <F5> :setlocal spell! spelllang=en_us<CR>

" Disable Macvim toolbar
if has("gui_running")
    set guioptions=-t
endif

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" forces air-line to show on all screens
set laststatus=2

" Turn on ragtag so we can get some nice formatting in eruby files
let g:ragtag_global_maps = 1

" Run checktime in buffers to see if the file timestamp has changed (forces
" relaod prompt
au CursorHold * if getcmdwintype() == '' | checktime | endif
au CursorHoldI * if getcmdwintype() == '' | checktime | endif
au BufEnter * if getcmdwintype() == '' | checktime | endif
au CursorMoved * if getcmdwintype() == '' | checktime | endif
au CursorMovedI * if getcmdwintype() == '' | checktime | endif

" Enable mouse control in normal mode
set mouse=nicr

" Cleaner split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Support for seamless tmux navigation between panes
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-;> :TmuxNavigatePrevious<cr>

if !isdirectory(expand("~/.vim/.backupdir/"))
    silent !echo "Creating backup dir..."
    silent !mkdir -p ~/.vim/.backupdir
endif

if !isdirectory(expand("~/.vim/.swap/"))
    silent !echo "Creating swap dir..."
    silent !mkdir -p ~/.vim/.swap
endif

if !isdirectory(expand("~/.vim/.undo/"))
    silent !echo "Creating undo dir..."
    silent !mkdir -p ~/.vim/.undo
endif
