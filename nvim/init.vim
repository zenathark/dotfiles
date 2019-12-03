call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'andymass/vim-matchup'

Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

Plug 'airblade/vim-rooter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

Plug 'andrewradev/splitjoin.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-fugitive'
"Plug 'tmsvg/pear-tree'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'pboettch/vim-cmake-syntax'

call plug#end()


inoremap jk <Esc>
inoremap kj <Esc>
nmap s :

"---------------------------- Base Editor Config -------------------------------
nnoremap <Space> <Nop>
let mapleader="\<Space>"
set fileformat=unix
set fileformats=unix,dos
set number
filetype plugin indent on
set autoindent
set timeoutlen=300 "  http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set guifont=Fira\ Code:h11
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
set signcolumn=yes

set splitright
set splitbelow

set undodir=~/.vimdid
set undofile

set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor



set tabstop=4
set shiftwidth=4
set cindent
set expandtab
set smarttab

set background=dark
colorscheme base16-onedark
syntax on

map <leader><leader> <Plug>(easymotion-prefix)
map <leader>f <Plug>(snipe-f)
map <leader>b <Plug>(snipe-b)

nmap <leader>/ <plug>NERDCommenterToggle
vmap <leader>/ <plug>NERDCommenterToggle
nmap <C-s> :w<CR>
imap <C-s> :w<CR>

nmap <leader>p :FZF<CR>

" NERDTree Config

nmap <leader>( :NERDTreeToggle<CR>


let g:NERDTreeGitStatusWithFlags = 1

if has('nvim')
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
  set inccommand=nosplit
  noremap <C-q> :confirm qall<CR>
end


"function! IsNERDTreeOpen()
  "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

"function! SyncTree()
  "if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction

"autocmd BufEnter * call SyncTree()
"---------------------------- CoC Configuration --------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"---------------------------- CoC Configuration --------------------------------
set hidden

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300
set shortmess+=c
set signcolumn=yes

" tab for trigger completion
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

" c-space for autocomplete trigger
inoremap <silent><expr> <c-space> coc#refresh()

" cr for autocomplete confirmation
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" [c y ]c to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostics-prev)
nmap <silent> ]c <Plug>(coc-diagnostics-next)

" Gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" k shows documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call CocAction('fold', <f-args>)

command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

"set statusline^=%{coc#status()}%{get(b:, 'coc_current_function', '')}

nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j :<C-u>CocNext<cr>
nnoremap <silent> <space>k :<C-u>CocPrev<cr>
"nnoremap <silent> <space>p :<C-u>CocListListResume<cr>

"---------------------------- Lightline Config ---------------------------------
"let g:lightline = {
      "\ 'component_function': {
      "\   'filename': 'LigthlineFilename',
      "\ },
"\ }
"function! LightlineFilename()
  "return expand('%:t') !=# '' ? @% : '[No Name]'
"endfunction

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

if executable('rg')
  set grepprg=rg\ --noheading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

"---------------------------- Secure Modeline Config ----------------------------
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]
