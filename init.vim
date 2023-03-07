let g:lsp_servers = [ 'vimls', 'lua_ls' ]

call plug#begin()
Plug 'voidekh/kyotonight.vim'
Plug 'itchyny/lightline.vim'
Plug 'josa42/nvim-lightline-lsp'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'tpope/vim-fugitive'
call plug#end()

set termguicolors
set signcolumn=yes
set nocompatible
set mouse=a
let g:mapleader = " "
syntax on
set clipboard=unnamedplus
set nu
set relativenumber
set encoding=UTF-8
set smarttab
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set textwidth=0
set wrapmargin=0
set colorcolumn=120
set whichwrap+=<>[]hl
set cursorline

set title
set laststatus=3
set noshowmode

colorscheme kyotonight

let g:lightline#lsp#indicator_warnings = " "
let g:lightline#lsp#indicator_errors = " "
let g:lightline#lsp#indicator_info = " "
let g:lightline#lsp#indicator_hints = " "
let g:lightline#lsp#indicator_ok = ""

function! SigmaGit() 
	let s:git_status = execute('!echo " $(git rev-parse --abbrev-ref HEAD)"')

    echo s:git_status
endfunction

let g:lightline = {
			\ 'colorscheme': 'kyotonight',
			\   'active': {
			\     'left': [[ 'mode', 'paste'], [ 'gitbranch', 'git_hunk'], ['lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok', 'lsp_status' ],
			\             ['readonly', 'filename', 'modified' ]],
			\   'right': [	 [ 'lineinfo' ],
			\              [ 'percent' ],
			\              [ 'fileformat', 'fileencoding', 'filetype']]
			\   },
			\ 'component_function': {
			\		'gitbranch': 'FugitiveHead'
			\	}
			\ }

" register compoments:
call lightline#lsp#register()
:lua require('lsp')
