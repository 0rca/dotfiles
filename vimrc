set nocompatible               " be iMproved
set encoding=utf-8
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ---------------
" Leader
" ---------------

" Set leader to ,
let mapleader=","

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

" My Bundles here:
"
Bundle 'Headlights'

Bundle 'tComment'
map <silent><D-/> :TComment<CR>


Bundle 'The-NERD-tree'
Bundle 'camelcasemotion'
Bundle 'Gist.vim'
Bundle 'Syntastic'
Bundle 'textobj-user'
Bundle 'textobj-rubyblock'
Bundle 'vim-coffee-script'
Bundle 'ZoomWin'
Bundle 'ledger.vim'
Bundle 'ledger.vim-indent'

" GitHub bundles
"
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/neocomplcache'
Bundle 'ervandew/supertab'


Bundle 'Lokaltog/vim-powerline'

" non github repos
"
Bundle 'git://git.wincent.com/command-t.git'

map <silent><D-t> :CommandT<CR>
let g:CommandTMaxHeight=25

" colorschemes
"
Bundle 'beauty256'
Bundle 'desert-warm-256'
Bundle 'github-theme'


filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" let g:solarized_termcolors=256

let g:macvim_hig_shift_movement=1

set background=light
set guifont=DejaVu\ Sans\ Mono:h12

set guioptions-=T

map <Leader>n :NERDTreeToggle<CR>


colorscheme github

" ----------------------------------------
" Regular Vim Configuartion (No Plugins Needed)
" ----------------------------------------
set keymodel=startsel
set mousemodel=popup

" ---------------
" Backups
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" ---------------
" UI
" ---------------
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set laststatus=2  " Always show the statusline
set cmdheight=2

" ---------------
" Behaviors
" ---------------
syntax enable
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=250     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set scrolloff=3               "more context around the cursor

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2 " Delete everything with backspace
set shiftwidth=2  " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search
set incsearch
set hlsearch

" ---------------
" Visual
" ---------------
set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-Right> :wincmd l<CR>


" Make line completion easier
imap <C-l> <C-x><C-l>

nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>v :e ~/.vimrc<CR>

" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost * silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  autocmd BufWritePre * :%s/\s\+$//e
  autocmd BufNewFile,BufRead *.ldg,*.ledger  setf ledger
endif

" remap CMD+N tab switching
noremap <D-1> 1gt
noremap <D-2> 2gt
noremap <D-3> 3gt
noremap <D-4> 4gt
noremap <D-5> 5gt
noremap <D-6> 6gt
noremap <D-7> 7gt
noremap <D-8> 8gt
noremap <D-9> 9gt
noremap <D-9> 10gt
map <D-S-Right> gt
map <D-S-Left> gT

" remap ZoomWin
map <Leader><Leader> :ZoomWin<CR>


" redundant whitespace highlighing
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


if !empty($MY_RUBY_HOME)
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/vendor_ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/user-gems/*.*'),"\n"),',')
endif
