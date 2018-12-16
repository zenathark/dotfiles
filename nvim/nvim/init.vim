call plug#begin('~/.nvim/nvim/site')
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'
Plug 'SirVer/ultisnips'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/paredit.vim'
Plug 'eraserhd/parinfer-rust'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-commentary'
Plug 'osyo-manga/vim-anzu'
Plug 'easymotion/vim-easymotion'
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'flazz/vim-colorschemes'
call plug#end()

let g:lightline = {
	\ 'colorscheme': 'base16_onedark',
	\ }

set number
set nocompatible
set hidden
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let mapleader = "\<space>"
no d h
no h j
no t k
no n l
no s :
no j d
no l n
no L N
no - $
no _ ^
no N <C-w><C-w>
no H 8<Down>
no T 8<Up>
no D <C-w><C-r>
nmap <leader>ff :FZF<CR>
noremap <C-s> <Esc>:update<CR>
