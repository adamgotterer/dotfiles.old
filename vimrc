" proper control character: X 

filetype off
set nocompatible            " don't be compatible with vi

call plug#begin('~/.vim/plugged')

" Plugins #########################################
Plug 'gmarik/vundle'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kevinw/pyflakes-vim'
Plug 'bling/vim-airline'
Plug 'jtratner/vim-flavored-markdown'
Plug 'mitechie/pyflakes-pathogen'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'glittershark/vim-colors-solarized'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-obsession'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'hashivim/vim-terraform'
Plug 'elixir-editors/vim-elixir'
Plug 'troydm/zoomwintab.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-rhubarb'
" end plugins #####################################
call plug#end()

filetype plugin indent on

set nowrap                  " don't wrap text
set formatoptions=l wrapmargin=0 " don't break text to a new line when it reaches the textwidth
set textwidth=110           " Show a visual marker at 100 characters
set colorcolumn=+0          " Set a visual marker at 100 characters
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set lazyredraw
set ttyfast
set backupcopy=yes          " Needed to get proper user ownership and syncing to Docker for things like gaurd

set path=.,,** " Always set the path to the current files directory

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_ruby_rubocop_args='--display-cop-names'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 2
let g:syntastic_enable_signs = 0

set nu
autocmd FileType ruby     setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript     setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType crystal     setlocal shiftwidth=2 tabstop=2
autocmd FileType html     setlocal shiftwidth=2 tabstop=2
autocmd FileType eruby  setlocal shiftwidth=2 tabstop=2
autocmd FileType ghmarkdown  setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

augroup ruby
  au!
  au FileType ruby nnoremap <buffer> gy orequire 'pry'; binding.pry<ESC>^
  au FileType ruby nnoremap <buffer> gY Orequire 'pry'; binding.pry<ESC>^
augroup END

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
" let mapleader = ","
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
set scrolloff=3
set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>s :set nolist!<CR>
:au BufNewFile,BufRead Vagrantfile :set filetype=ruby
:au BufNewFile,BufRead Gemfile :set filetype=ruby
:au BufNewFile,BufRead *.task :set filetype=ruby

au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" Color scheme
let g:solarized_termcolors = 16
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized
set bg=dark

" remove trailing whitespace {{{
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
augroup striptrailingwhitespaces " {{{
autocmd FileType c,cpp,java,php,ruby,python,sql,tf,tfvars,js,javascript,sh,jst,less,haskell,haml,coffee,scss,clojure
  \ autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END " }}}

"PHP tabs
au FileType php setlocal tabstop=4
au FileType php setlocal shiftwidth=4
au FileType php setlocal softtabstop=4
au FileType php setlocal noexpandtab

"Ruby setup
au FileType ruby setlocal ic " Case insensitive search
au FileType ruby setlocal hls " Highlight search
au FileType ruby setlocal showmatch " Show matching brackets
au FileType ruby setlocal expandtab
au FileType ruby setlocal autoindent
au FileType ruby setlocal smartindent
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
let g:airline_powerline_fonts = 1

" Turn on ragtag so we can get some nice formatting in eruby files
let g:ragtag_global_maps = 1

" Run checktime in buffers to see if the file timestamp has changed (forces
" relaod prompt
augroup buffer_check
  au!
  au CursorHold * if getcmdwintype() == '' | checktime | endif
  au CursorHoldI * if getcmdwintype() == '' | checktime | endif
  au BufEnter * if getcmdwintype() == '' | checktime | endif
  au CursorMoved * if getcmdwintype() == '' | checktime | endif
  au CursorMovedI * if getcmdwintype() == '' | checktime | endif
augroup END

" Enable mouse control in normal mode
set mouse=nicr

" Wrap toggling
nmap <Leader>w :set wrap!<cr>
nmap <Leader>W :set nowrap<cr>

" Move a line of text up or down
"
" The execute is a hack to get alt to correctly map
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" Resize current buffer by +/- 5
nnoremap <leader>h :vertical resize -5<cr>
nnoremap <leader>j :resize +5<cr>
nnoremap <leader>k :resize -5<cr>
nnoremap <leader>l :vertical resize +5<cr>

" Zoomwintab.vim
noremap <leader>z :ZoomWinTabToggle<cr>

" Cleaner split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split panes to the right and bottom (feels more natural)
set splitbelow
set splitright

" Support for seamless tmux navigation between panes
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-;> :TmuxNavigatePrevious<cr>

" Remap esc in terminal to go back to normal mode
" tnoremap <Esc> <C-\><C-n>

"" Remap definition lookup since its fat fingered when navigating splits a lot
nnoremap <leader>gd <S-k>

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

set backupdir^=~/.vim/.backupdir//
set directory^=~/.vim/.swap//                " where to put swap files
set undodir^=~/.vim/.undo//                  " where to put undo files

" vim-test mapping
command! TestN :TestNearest
command! TestF :TestFile
command! TestA :TestSuite
command! TestL :TestLast
command! TestV :TestVisit

" vim-test strategy
let test#strategy = "neovim"

" Resize the quick fix window
augroup quickfixheight
  autocmd!
  autocmd FileType qf 20wincmd _
augroup END

" Ctrl-p Ignore list
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*__pycache__/*
let g:ctrlp_show_hidden = 1
" Ignore files in gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" NerdSpace
let g:NERDSpaceDelims = 1
