" Fish has issues with other programs 
set shell=/bin/bash
let mapleader = "\<Space>"

" -----------------------------------------------------------------------------
"  * Plugins
" -----------------------------------------------------------------------------
"  Better safe than sorry
set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

" NVim enhacements
Plug 'ciaranm/securemodelines'
Plug 'justinmk/vim-sneak'

" Visuals
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
" Syntax
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ncm2/ncm2'


Plug 'chriskempson/base16-vim'

" Fuzzy finder
Plug 'airblade/vim-rooter'
"Plug '/usr/bin/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" Clojure
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'
Plug 'luochen1990/rainbow'


call plug#end()

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

if !has('gui_running')
    set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
    set termguicolors
endif

set background=dark
let base16colorspace=256
colorscheme base16-onedark
hi Normal ctermbg=NONE
syntax on

" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",      "tw",
                \ "softtabstop",    "sts",
                \ "shiftwidth",     "sw",
                \ "expandtab",      "et",   "noexpandtab",  "noet",
                \ "filetype",       "ft",
                \ "foldmethod",     "fdm",
                \ "readonly",       "ro",   "noreadonly",   "noro",
                \ "rightleft",      "rl",   "norightleft",  "norl",
                \ "colorcolumn"
                \ ]

let g:lightline = {
        \ 'component_function': {
        \   'filename': 'LightlineFilename',
        \ },
\ }
function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Speedup Ctrl-P maybe not needeed https://github.com/sheerun/blog/blob/master/_posts/2014-03-21-how-to-boost-your-vim-productivity.markdown
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" Hotkeys
nmap <leader>s :Buffers<CR>
nmap <leader>S :Files<CR>

                
" -----------------------------------------------------------------------------
"  * Editor Settings
" -----------------------------------------------------------------------------
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
set signcolumn=yes

" ???
set exrc
set secure

" Splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,.~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" Wrapping
set formatoptions=tc
set formatoptions+=r
set formatoptions+=q
set formatoptions+=n
set formatoptions+=b

" Search
set incsearch
set ignorecase
set smartcase
set gdefault

" Centered results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Check
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" -----------------------------------------------------------------------------
"  * Visual Settings
" -----------------------------------------------------------------------------
set guioptions-=T " Remove toolbar
set vb t_vb= " No beep
set backspace=2 " Backspace over newlines
set nofoldenable
set ruler 
set ttyfast
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber
set number
set diffopt+=iwhite " No whitespace in vimdiff
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=80
set showcmd
set mouse=a
set shortmess+=c

" Hidden characters
set nolist
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" -----------------------------------------------------------------------------
"  * Hotkeys
" -----------------------------------------------------------------------------
nnoremap s ;

" Ctrl+c and ctrl+h as esc macs have no ctrl on left
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
inoremap <C-h> <Esc>
vnoremap <C-h> <Esc>

" Suspend with Ctrl f
inoremap <C-f> :sus<cr>
vnoremap <C-f> :sus<cr>
nnoremap <C-f> :sus<cr>

" Vim dvorak remmaping, doesn't work with other editors :P
no h j
no d h
no t k
no k t
no n l
no s :
no j d
no l n
no L N
no _ ^
no - $

" X clipboard integration
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" rg search with <leader>s
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

function! s:list_cmd()
    let base = fnamemodify(expand('%'), ':h:.:S')
    return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
    \                               'options': '--tiebreak=index'}, <bang>0)

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

"nnoremap h gj
"nnoremap k gk

" Jump to next previous error
nmap <silent> <C-t> <Plug>(ale_previous_wrap)
nmap <silent> <C-h> <Plug>(ale_next_wrap)
nmap <silent> N <Plug>(ale_lint>
nmap <silent> <C-l> <plug>(ale_detail)
nmap <silent> <C-g> :close<cr>
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <C-^>

" TODO: Reformat
"
" hidden characers
nnoremap <leader>, :set invlist<cr>

" show stats
nnoremap <leader>q g<c-g>

noremap <leader>m ct_
noremap <leader>n ct-

" M to make
noremap M :!make -k -j4<cr>

map <F1> <Esc>
imap <F1> <Esc>

" -----------------------------------------------------------------------------
"  * Autocommands
" -----------------------------------------------------------------------------
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

autocmd InsertLeave * set nopaste

if has("autocmd")
    au bufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Automake scss
autocmd BufWritePost *.scss if filereadable("Makefile") | make | endif

au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100

au Filetype clojure source ~/.config/nvim/scripts/clojure.vim
au Filetype clojurescript source ~/.config/nvim/scripts/clojure.vim

" File autodetection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex

" Script plugins
autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scrips/closetag.vim

" nvim
"if has('nvim')
"    runtime! plugin/python_setup.vim
"endif
