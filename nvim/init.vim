call plug#begin('~/.config/nvim/plugged')

" General plugins
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'gosukiwi/vim-atom-dark'
Plug 'lsdr/monokai'

" Search plugins
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dkprice/vim-easygrep'
Plug 'jeetsukumaran/vim-filesearch'

" Markdown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" HTML support
Plug 'othree/html5.vim', { 'for': 'html' }

" CSS support
Plug 'lilydjwg/colorizer', { 'for': ['scss', 'css'] }

" Javascript support
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' }

" Jsdock sytax

" Python support
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }

" Nginx
Plug 'vim-scripts/nginx.vim'

call plug#end()

"
" Plugins configuration
"

" Auto start Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'file', 'ultisnips']

let g:deoplete#file#enable_buffer_path = 1

" NERDTree configuration
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

" Split window verticaly on UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"

"
" Env variables
"

let $FZF_DEFAULT_COMMAND='ag -g ""'

"
" Common settings
"

set encoding=utf-8
set autoread
set backspace=indent,eol,start
set ruler
set colorcolumn=120
set showmode
set cursorline
set history=1000
set hidden
set relativenumber
syntax on
set ignorecase
set smartcase
set incsearch
set showmatch
set noerrorbells
set novisualbell
set visualbell t_vb=
set laststatus=2
set number
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:»·,trail:·,nbsp:·

set nowrap

" show completion options on <TAB>
set wildmenu
" complete only up to the point of ambiguity
set wildmode=list:longest

" turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" set colorscheme
set t_Co=256
let base16colorspace=256
set background=dark
colorscheme base16-railscasts
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Sync " and + registers
set clipboard=unnamedplus

"
" Key mappings
"

" Map leader
let mapleader=","

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" Toggle between line numbers and relative line numbers
nnoremap <silent><leader>u :exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>

" CtrlP
let g:ctrlp_show_hidden = 1

" FZF
nnoremap <silent><C-P> :Files<CR>
nnoremap <silent><Leader><Enter>  :Buffers<CR>

" move between splits with hjkl
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Remove search highlight on Enter
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Don't loose selection on < or >
xnoremap <  <gv
xnoremap >  >gv

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Linting support
"autocmd FileType javascript InsertChange,TextChanged * update | :Neomake
autocmd BufWrite * :Neomake

let g:neomake_javascript_enabled_makers = ['eslint']

" load local eslint in the project root
" modified from https://github.com/mtscout6/syntastic-local-eslint.vim
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

"
" Autocmd
"

" trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" File types
au BufRead,BufNewFile *.es6 setfiletype javascript

"Setup Javascript plugins
let g:used_javascript_libs = 'react,chai,handlebars,underscore'

" Toggle between line numbers and relative line numbers
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber

" Fix yank for X11 clipboard
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

" Python features

" PEP8 identation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Show wrong whitespaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p p:call ClipboardPaste()<cr>
