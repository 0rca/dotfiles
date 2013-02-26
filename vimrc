set nocompatible               " be iMproved
set encoding=utf-8
filetype off                   " required!

call pathogen#infect()
syntax on
filetype plugin indent on

" ---------------
" Leader
" ---------------

" Set leader to ,
let mapleader=","

"
" github/vim-scripts
"
" Bundle: tComment
" Bundle: camelcasemotion
" Bundle: ZoomWin
" Bundle: ack.vim
" Bundle: apidock.vim
" Bundle: Rainbow-Parentheses-Improved-and2
" Bundle: github-theme
" Bundle: Railscasts-Theme-GUIand256color

"
" GitHub
"
" Bundle: kana/vim-textobj-user
" Bundle: nelstrom/vim-textobj-rubyblock
" Bundle: scrooloose/syntastic
" Bundle: scrooloose/nerdtree
" Bundle: tpope/vim-sensible
" Bundle: tpope/vim-haml
" Bundle: tpope/vim-fugitive
" Bundle: tpope/vim-bundler
" Bundle: tpope/vim-eunuch
" Bundle: tpope/vim-rails
" Bundle: tpope/vim-unimpaired
" Bundle: tpope/vim-surround
" Bundle: tpope/vim-repeat
" Bundle: tpope/vim-abolish
" Bundle: tpope/vim-endwise
" Bundle: kchmck/vim-coffee-script
" Bundle: ledger/vim-ledger
" Bundle: Lokaltog/vim-easymotion
" Bundle: Lokaltog/vim-powerline develop
" Bundle: MarcWeber/vim-addon-local-vimrc
" Bundle: guns/vim-clojure-static
" Bundle: wlangstroth/vim-haskell
" Bundle: Shougo/neocomplcache
" Bundle: ervandew/supertab
" Bundle: briandoll/change-inside-surroundings.vim
" Bundle: claco/jasmine.vim
" Bundle: git://git.wincent.com/command-t.git
" BundleCommand: /usr/bin/rake make
" Bundle: sjl/gundo.vim
" Bundle: mattn/webapi-vim
" Bundle: mattn/gist-vim

map <silent><D-t> :CommandT<CR>
let g:CommandTMaxHeight=25
let g:Powerline_symbols = 'fancy'
let g:macvim_hig_shift_movement=1
map <silent><D-/> :TComment<CR>
" let g:rainbow_active = 1
" let g:rainbow_operators = 1

" from (http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/)
let NERDTreeHijackNetrw=1
map <Leader>n :NERDTreeToggle<CR>


if has('gui_running')
  colorscheme github
  set guifont=DejaVu\ Sans\ Mono:h16
  set guioptions-=T
else
  colorscheme railscasts
endif

" ----------------------------------------
" Regular Vim Configuartion (No Plugins Needed)
" ----------------------------------------
set keymodel=startsel
set mousemodel=popup

" ---------------
" UI
" ---------------
set nu  " Line numbers on
set nowrap  " Line wrapping off
set cmdheight=2

" ---------------
" Behaviors
" ---------------
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set timeoutlen=250     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql

" ---------------
" Text Format
" ---------------
set tabstop=2
set shiftwidth=2  " Tabs under smart indent
set cindent
set expandtab
set backspace=2

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set hlsearch

" ---------------
" Visual
" ---------------
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

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
  autocmd BufNewFile,BufRead *.md  set filetype=markdown

  " because Apple Sandbox configs are LISP! ^__^
  autocmd BufRead *.sb             setf lisp
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

if !empty($MY_RUBY_HOME)
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/vendor_ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/user-gems/*.*'),"\n"),',')
endif

