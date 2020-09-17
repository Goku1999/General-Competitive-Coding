syntax on
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
call plug#begin('~/.vim/plugged')
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ap/vim-buftabline'
call plug#end()
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set hidden
nnoremap <C-M> :bnext<CR>
nnoremap <C-P> :bprev<CR>
set splitbelow
set splitright

" NerdTree stuff
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.rkt,*.h
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix | 

set encoding=utf-8


" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


highlight Comment cterm=italic gui=italic

set laststatus=2
" set showtabline=2

" true colours
set background=dark
set t_Co=256

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

colorscheme nord 
let g:palenight_terminal_italics=1

set nu rnu
set clipboard=unnamed
set ruler
set showcmd
set noswapfile
set noshowmode
set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F2> " enable paste mode

set wildmenu "graphical auto complete menu
set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searcher
" clears highlights
nnoremap // :noh<return> 

" run code
nnoremap \ :te<enter>
autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
autocmd filetype cpp nnoremap <f5> :w <bar> !g++ -std=c++11 % -o %:r && %:r <cr>
autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
autocmd filetype java nnoremap <F5> :w <bar> :!javac % <CR>:!java %< <CR>
:imap jj <Esc>
