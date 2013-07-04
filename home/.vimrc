set nocompatible               " be iMproved
set encoding=utf-8
filetype off                   " required!
set nobackup

call pathogen#infect()
syntax on
filetype plugin indent on

" Set leader to ,
let mapleader=","

"
" github/vim-scripts
"
" Bundle: tComment
" Bundle: camelcasemotion

" Bundle: ack.vim
" Bundle: apidock.vim
" Bundle: Rainbow-Parentheses-Improved-and2
" Bundle: Align

"
" GitHub
"
" Bundle: SirVer/ultisnips
" Bundle: JazzCore/neocomplcache-ultisnips
" Bundle: sunaku/vim-ruby-minitest
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
" Bundle: tpope/vim-fireplace
" Bundle: tpope/vim-classpath
" Bundle: tpope/vim-scriptease
" Bundle: tpope/vim-obsession
" Bundle: tpope/vim-ragtag
" Bundle: kchmck/vim-coffee-script
" Bundle: ledger/vim-ledger
" Bundle: Lokaltog/vim-easymotion
" Bundle: Lokaltog/vim-powerline develop
" Bundle: guns/vim-clojure-static
" Bundle: wlangstroth/vim-haskell
" Bundle: Shougo/neocomplcache
" Bundle: ervandew/supertab
" Bundle: briandoll/change-inside-surroundings.vim
" Bundle: claco/jasmine.vim
" Bundle: kien/ctrlp.vim
" Bundle: sjl/gundo.vim
" Bundle: sjl/clam.vim
" Bundle: sjl/vitality.vim
" Bundle: mattn/webapi-vim
" Bundle: mattn/gist-vim
" Bundle: grillpanda/github-colorscheme
" Bundle: xolox/vim-reload
" Bundle: vim-ruby/vim-ruby
" Bundle: skwp/YankRing.vim
" Bundle: guns/xterm-color-table.vim
" Bundle: 0rca/vim-dash
" Bundle: majutsushi/tagbar
" Bundle: altercation/vim-colors-solarized
" -Bundle: flazz/vim-colorschemes
" Bundle: tjennings/git-grep-vim
" Bundle: rking/ag.vim
" Bundle: nono/vim-handlebars
" -Bundle: mhinz/vim-signify
" -Bundle: mhinz/vim-startify
" Bundle: jszakmeister/vim-togglecursor
" Bundle: jonathanfilip/vim-lucius

" vim-togglecursor
let g:togglecursor_insert='underline'

" let g:Powerline_symbols = 'fancy'
let g:macvim_hig_shift_movement=1

let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=80

map <Leader>n :NERDTreeToggle<CR>
map <silent><D-/> :TComment<CR>
nmap <F8> :TagbarToggle<CR>

let g:ctrlp_extensions = ['line']
let g:ctrlp_max_height = 25
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

let g:neocomplcache_enable_ignore_case = 0
nmap ,f :CtrlPLine<CR>

if has('gui_running')
  colorscheme solarized
  set background=light
  set guifont=Anonymous\ Pro:h16
  set guioptions-=T
  set linespace=0
else
  colorscheme solarized
endif
set guicursor+=n-v-c:blinkon0

" for vim-signify
hi clear SignColumn
" ----------------------------------------
" Regular Vim Configuartion (No Plugins Needed)
" ----------------------------------------
set keymodel=startsel
set mousemodel=popup

" ---------------
" UI
" ---------------
set nu  " Line numbers on
set numberwidth=5      " don't plan on editing files longer than 65535 lines
set nowrap  " Line wrapping on
set linebreak "Break lines a little smarter
set textwidth=78
set colorcolumn=+1
set cmdheight=2
set wildmode=full
set cursorline

" These can affect plugins (beware)
nnoremap j gj
nnoremap k gk

" ---------------
" Behaviors
" ---------------
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set timeoutlen=500     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql

" ---------------
" Text Format
" ---------------
set tabstop=2
set shiftwidth=2  " Tabs under smart indent
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
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" spell
nmap <silent> <leader>s :set spell!<CR>

" source vimrc and runtime
nmap <silent> <leader>v :Runtime<CR>

" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")

  " auto-wrap when editing text files
  autocmd BufRead *.txt :set formatoptions+=a

  autocmd BufNewFile,BufRead * :set formatoptions-=o

  " set C style indent, whatever it means
  autocmd BufNewFile,BufRead *.c :set cindent

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
  autocmd BufNewFile,BufRead *.hamlc  setf haml
  " autocmd FocusLost,Tableave * stopinsert

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


nmap <silent> ,/ :nohlsearch<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap


" remap escape insert mode
inoremap lk <Esc>

" https://ariejan.net/2012/03/21/from-11-34s-to-0-625s-for-opening-a-rb-file-in-vim/
if !empty($MY_RUBY_HOME)
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n"
    \ .glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*.*')."\n"
    \ .glob($MY_RUBY_HOME.'/lib/ruby/vendor_ruby/*.*')."\n"
    \ .glob($MY_RUBY_HOME.'/lib/ruby/user-gems/*.*'),"\n"),',')
endif

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set fillchars=vert:│


set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Blue
" setlocal spell spelllang=ru_yo,en_us
set foldmethod=indent


nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
nmap <Leader>a :GitGrep
nmap <Leader>A :Ack

nmap <C-W><C-C> <C-W>c

