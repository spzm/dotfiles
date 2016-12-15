call plug#begin('~/.config/nvim/plugged')

" General plugins
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'

" Search plugins
Plug 'tpope/vim-repeat'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'

" Markdown support
Plug 'plasticboy/vim-markdown'

" HTML support
Plug 'othree/html5.vim', { 'for': 'html' }

" CSS support
Plug 'lilydjwg/colorizer', { 'for': ['scss', 'css'] }

" Javascript support
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'elzr/vim-json', { 'for': ['json'] }
Plug 'benjie/neomake-local-eslint.vim', { 'for': ['javascript', 'javascript.jsx'] }


" Unit tests
Plug 'janko-m/vim-test'

" Jsdock sytax

" Python support
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'hdima/python-syntax', { 'for': 'python' }

" Elm support
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

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
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips']
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'


" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1

let g:deoplete#file#enable_buffer_path = 1

" JSON plugin
let g:vim_json_syntax_conceal = 0

" NERDTree configuration
let NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 35
let NERDTreeShowHidden=1

" NERDCommenter
let NERDSpaceDelims=1

" Split window verticaly on UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"

" Airline config
let g:airline#extensions#tabline#enabled = 1

"
" Env variables
"

let $FZF_DEFAULT_COMMAND='ag -l -U --ignore={node_modules,.git} -g ""'

"
" Common settings
"
set termencoding=utf-8
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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Russian layout fixes
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Display tabs and trailing spaces visually
set list listchars=tab:»·,trail:·,nbsp:·

set wrap

" show completion options on <TAB>
set wildmenu
" complete only up to the point of ambiguity
set wildmode=list:longest

" turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile

" set colorscheme
let base16colorspace=256
set t_Co=256
set background=dark
colorscheme hybrid
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Sync " and + registers
set clipboard=unnamedplus

"
" Key mappings
"

" Map leader
let mapleader="\<Space>"
let maplocalleader = "\<Space>"

" reload init.vim
nnoremap <silent> <leader>ev :tabe $HOME/.config/nvim/init.vim<CR>
" edit init.vim
nnoremap <silent> <leader>sv :so $HOME/.config/nvim/init.vim<CR>
" switch between the last two files
" map <Tab> :b#<CR>

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" Toggle between line numbers and relative line numbers
nnoremap <silent><leader>u :exe "set " . (&relativenumber == 1 ? "norelativenumber" : "relativenumber")<cr>

" CtrlP
let g:ctrlp_show_hidden = 1

" FZF
nnoremap <silent><C-P> :Files<CR>
nmap <silent><C-F> :Ag<CR>
nnoremap <silent><Leader><Enter>  :Buffers<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'

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
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Grepper
nnoremap <leader>p :Grepper<cr>

" Linting support
let g:neomake_javascript_eslint_maker = {
\ 'args': ['--env', 'es6', '-f', 'compact'],
\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,%W%f: line %l\, col %c\, Warning - %m'
\ }

autocmd BufRead,BufWrite,BufReadPost,BufWritePost,BufEnter * :Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" Javascript libraries syntax
let g:used_javascript_libs = 'underscore,angularjs,angularui,angularuirouter,react,chai,handlebars,d3'

" Gitgutter navigation
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
hi clear SignColumn

"
" Autocmd
"

" trim whitespace on save
au BufWritePre * :%s/\s\+$//e

" File types
let g:jsx_ext_required = 0
au BufRead,BufNewFile *.es6 setfiletype javascript
highlight link xmlEndTag xmlTag

" Setup Javascript plugins
let g:javascript_plugin_jsdoc = 1

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


" vim-test
let test#javascript#mocha#executable = 'npm run test'
let g:test#javascript#mocha#file_pattern = '\.spec\.*'
let test#strategy = "neovim"

map <leader>sr :TestSuite<CR>
map <leader>ss :TestNearest<CR>
map <leader>sf :TestFile<CR>
map <leader>sl :TestLast<CR>
