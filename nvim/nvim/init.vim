call plug#begin('~/.nvim/nvim/site')
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
"Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'
Plug 'SirVer/ultisnips'
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
"Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-commentary'
" Plug 'osyo-manga/vim-anzu'
Plug 'easymotion/vim-easymotion'
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'flazz/vim-colorschemes'
Plug 'vim-syntastic/syntastic'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-ctrlspace/vim-ctrlspace'
" Plug 'derekwyatt/vim-fswitch'
" if has("win32")
" 	Plug '~/.fzf'
" else
" 	Plug 'junegunn/fzf', { 'dir:' '~/.fzf', 'do': './install -all' }
" end
" Plug 'junegunn/fzf.vim'
call plug#end()


" UI
" let g:lightline = {
" 	\ 'colorscheme': 'base16_onedark',
" 	\ }

let g:rainbow_active = 1

" Compatibility
set number
set nocompatible
set hidden
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" let mapleader = "\<Space>"

" Vim surround remapping so it doesn't collision with dvorak d remapping
let g:surround_no_mappings = 1

nmap js  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround
imap <C-G>s <Plug>Isurround
imap <C-G>S <Plug>ISurround

" Vim dvorak remapping
no h j
no d h
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
no D <C-w><S-w>

"ctrl-space
nnoremap <silent><C-p> :CtrlSpace O<CR>
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

"fuzzy finder enigne fzf
""TODO
"nmap <leader>ff :FZF<CR>
" nmap <leader>ff :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached', 'sink': 'edit'}))<Enter>
" nmap <leader>po :GFiles<CR>
" nmap <leader>bb :Buffers<CR>

noremap <C-s> <Esc>:update<CR>

" nmap <silent> <Leader>of :FSHere<cr>
"Switch to the file and load it into the window on the right >
"nmap <silent> <Leader>ol :FSRight<cr>
""Switch to the file and load it into a new window split on the right >
"nmap <silent> <Leader>oL :FSSplitRight<cr>
""Switch to the file and load it into the window on the left >
"nmap <silent> <Leader>oh :FSLeft<cr>
""Switch to the file and load it into a new window split on the left >
"nmap <silent> <Leader>oH :FSSplitLeft<cr>
""Switch to the file and load it into the window above >
"nmap <silent> <Leader>ok :FSAbove<cr>
""Switch to the file and load it into a new window split above >
"nmap <silent> <Leader>oK :FSSplitAbove<cr>
""Switch to the file and load it into the window below >
"nmap <silent> <Leader>oj :FSBelow<cr>
""Switch to the file and load it into a new window split below >
"nmap <silent> <Leader>oJ :FSSplitBelow<cr>


" Config fsharp
" let g:fsharp_interactive_bin = 'fsi'
" let g:fsharp_only_check_errors_on_write = 1
" let g:fsharpbinding_debug = 1
