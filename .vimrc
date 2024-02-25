source $VIMRUNTIME/defaults.vim

" PLUGINS ------------------------------------------------------ {{{

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'

	Plug 'https://github.com/junegunn/vim-github-dashboard.git'

	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

	Plug 'fatih/vim-go', { 'tag': '*' }

	Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	Plug '~/my-prototype-plugin'

call plug#end()

" }}}

" MAPPINGS ------------------------------------------------------ {{{

let mapleader=","

" The Nerd Tree 
nmap <leader>nt :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Tagbar 
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_width=40
let g:tagbar_autofocus=40
let g:tagbar_autoclose=0
let g:tagbar_iconchard=['>', 'v']
let g:tagbar_systemenc='utf-8'

" miniBufExpl
nmap <C-n> :bn<CR>
nmap <C-m> :bp<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-w>j
nmap <C-K> <C-w>k
nmap <C-L> <C-w>l

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

