" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    "Add your bundles here
    Bundle 'scrooloose/syntastic'
    Bundle 'https://github.com/tpope/vim-fugitive'
    Bundle 'scrooloose/nerdtree' 
    Bundle 'flazz/vim-colorschemes'
    Bundle 'tpope/vim-surround'
    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle "tomtom/tlib_vim"
    Bundle "garbas/vim-snipmate"
    Bundle "honza/vim-snippets"
    Bundle 'tComment'
    Bundle 'tpope/vim-rails'
    Bundle 'wavded/vim-stylus'
    Bundle 'hail2u/vim-css3-syntax'
    Bundle 'klen/rope-vim'
    Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
    Bundle 'phpvim'
    Bundle 'moll/vim-node'
    Bundle 'klen/python-mode'
    Bundle 'davidhalter/jedi-vim'
    Bundle 'vim-coffee-script'
    Bundle 'lukerandall/haskellmode-vim'
    Bundle 'slim-template/vim-slim'
    Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
"set line numbers
set number
"Maximize gvim window
if has("gui_running")
    colorscheme base16-monokai
    set bg=dark
    set guioptions-=T
    set guioptions-=r
    set guifont=Inconsolata_for_Powerline:h13
    set columns=100
    set lines=50
    set encoding=utf-8
else
    set encoding=utf-8
    set t_Co=256
    set term=xterm-256color
    colorscheme molokai
    set bg=dark
    set termencoding=utf-8
endif 
"default indentation
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
"Extra keys
:imap jj <Esc>
:nmap ññ :
"enable check for type of file and syntax
filetype plugin on
filetype indent plugin on
syntax on

"Tex Config
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats = 'dvi,pdf,ps'

"Hidden chars
set listchars=tab:▸\ ,eol:¬

"leader \
nmap <leader>l :set list!<CR>

" Powerline Config
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

"Python config

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0 "Using jedi-vim rope disabled

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = ["pyflakes" ,"pep8"]
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

if has("autocmd")
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType *.tex setlocal ts=2 sts=2 sw=2 expandtab spell spelllang=en_us 
endif

"Insert just one char with space
:nmap <Space> i_<Esc>r
au Bufenter *.hs compiler ghc
let g:haddock_browser="open"
let g:haddock_browser_callformat = "%s %s"
let g:syntastic_enable_signs=1
let g:syntastic_mode_map={ 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['slim'] }
let g:syntactic_check_on_open=1
