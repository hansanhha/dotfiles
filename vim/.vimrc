source $VIMRUNTIME/defaults.vim

" PLUGINS ------------------------------------------------------ {{{

call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

    Plug 'dense-analysis/ale'
call plug#end()

" }}}

" MAPPINGS ------------------------------------------------------ {{{

let mapleader=","

" The Nerd Tree 
nnoremap <leader>nt :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Tagbar 
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_width=40
let g:tagbar_autofocus=40
let g:tagbar_autoclose=0
let g:tagbar_iconchard=['>', 'v']
let g:tagbar_systemenc='utf-8'

" save key
inoremap <C-s> <ESC>:w<CR>a


" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}


" SETTINGS ------------------------------------------------------ {{{

set hidden
set autowrite
set number
set ignorecase 
set smartcase
"set gdefault
"set colorcolumn=80
"set textwidth=79
set cursorline
"set ruler
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set cindent
set smartindent
set autoindent
set copyindent
set foldmethod=marker
set nocompatible
set showcmd
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
syntax on
filetype on
filetype plugin on
filetype indent on

" }}}

" Global Variables ------------------------------------------------------ {{{

let g:UltiSnipsExpandOrJumpTrigger = "<tab>"

" }}}
