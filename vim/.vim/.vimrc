" ===== Basic settings =====
set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8

" UI
set number                      " show line numbers
set relativenumber              " relative numbers
set cursorline                  " highlight current line
set showcmd
set ruler
set laststatus=2
set showmode

" Indentation & tabs
set tabstop=4
set shiftwidth=4
set expandtab                    " use spaces
set smarttab
set autoindent
set smartindent

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Backups
set undofile
set undodir=~/.vim/undo
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Display
set wrap
set linebreak
set visualbell
set signcolumn=yes

" Performance
set lazyredraw
set ttyfast

" Clipboard
if has('clipboard')
  set clipboard+=unnamedplusA
endif

" -------- Plugin section (vim-plug) --------
call plug#begin('~/.vim/plugged')

" File explorer
Plug 'scrooloose/nerdtree'
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Commenting
Plug 'tpope/vim-commentary'
" Autopairs
Plug 'jiangmiao/auto-pairs'
" Auto-completion (YouCompleteMe alternative: deoplete or coc.nvim)
" Here we use coc.nvim for LSP & completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippets (for coc)
Plug 'honza/vim-snippets'
" Syntax / Treesitter-like (better highlighting)
Plug 'sheerun/vim-polyglot'

call plug#end()

" ===== Key mappings =====
" Leader
let mapleader="\<Space>"

" NERDTree toggle
nnoremap <Leader>n :NERDTreeToggle<CR>

" FZF file search
nnoremap <Leader>f :Files<CR>

" Quick save & quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Move between splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Easy window resize
nnoremap <Leader><Left> :vertical resize -5<CR>
nnoremap <Leader><Right> :vertical resize +5<CR>
nnoremap <Leader><Up> :resize +3<CR>
nnoremap <Le nader><Down> :resize -3<CR>

" ===== coc.nvim basic settings =====
" Use <tab> for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#refresh()

" Use K to show documentation
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Format with coc
nnoremap <leader>f :call CocAction('format')<CR>

" Auto-fix on save (ESLint etc.)
autocmd BufWritePre *.js,*.ts :call CocAction('runCommand', 'editor.action.organizeImport')

" ===== Appearance =====
" Airline theme
let g:airline_theme='dark'

" ===== Filetype-specific settings =====
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType javascript,typescript setlocal expandtab shiftwidth=2 tabstop=2

" ===== Helpful extras =====
" Show matching bracket
set showmatch
" Highlight trailing whitespace
match ErrorMsg '\s\+$'
" Trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
