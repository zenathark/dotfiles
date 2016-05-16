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
    " Syntaxis checker
    Bundle 'scrooloose/syntastic'
    " Surround with tags
    Bundle 'tpope/vim-surround'
    " Add delimiter surrounding ()
    Bundle 'Raimondi/delimitMate'
    "Git Integration
    Bundle 'https://github.com/tpope/vim-fugitive'
    "File Navegation
    Bundle 'scrooloose/nerdtree'
    "Move arond easier lead lead b n
    Bundle 'Lokaltog/vim-easymotion'
    "Better buffexplorer like NerdTree
    Bundle 'jlanzarotta/bufexplorer'
    "Fuzzy file searcher
    Bundle 'kien/ctrlp.vim'
    "Fuzzy Autocompleter
    Bundle 'Valloric/YouCompleteMe'
    "SuperTab for UltiSnip YMC interoperation
    Bundle 'ervandew/supertab'
    "UI Colors
    Bundle 'flazz/vim-colorschemes'
    " Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Bundle 'bling/vim-airline'
    "Dependency ?
    Bundle 'tomtom/tlib_vim'
    "Snippets
    Bundle 'SirVer/ultisnips'
    " Old snippets plugin
    " Bundle 'garbas/vim-snipmate'
    Bundle "honza/vim-snippets"
    " Block commenter
    Bundle 'tComment'
    " Languaje Specific
    " RubyRails
    Bundle 'tpope/vim-rails'
    " CSS
    Bundle 'wavded/vim-stylus'
    Bundle 'hail2u/vim-css3-syntax'
    " Latex
    Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
    " PHP
    Bundle 'phpvim'
    " Node
    Bundle 'moll/vim-node'
    " CoffeScript
    Bundle 'vim-coffee-script'
    " Slim/HTML
    Bundle 'slim-template/vim-slim'
    " Python
    Bundle 'nvie/vim-flake8'
    " Disabled in favor of YCM
    " Bundle 'klen/python-mode'
    " Bundle 'davidhalter/jedi-vim'
    " Disabled in favor of YCM
    " Bundle 'klen/rope-vim'
    " snipMate dependency
    " Bundle 'MarcWeber/vim-addon-mw-utils'
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
    "Remove left scrollbar
    set go-=L
    set guifont=Source\ Code\ Pro\ for\ Powerline:h13
    set columns=100
    set lines=50
    set encoding=utf-8
    set cursorline
else
    set term=xterm-256color
    set encoding=utf-8
    set termencoding=utf-8
    " set t_Co=256
    colorscheme base16-monokai
    set bg=dark
    set guifont=Source\ Code\ Pro\ for\ Powerline:h13
endif
"default indentation
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
"Extra keys
:imap kj <Esc>
:nmap ññ :
"Latin America keyboard specifics
"Hidden chars
nmap <leader>h :set list!<CR>
set listchars=tab:▸\ ,eol:¬
"Insert just one char with space
:nmap <Space> i_<Esc>r
"enable check for type of file and syntax
filetype plugin on
filetype indent plugin on
syntax on
"------------------Plug In Specfics ------------------------------------------
"
"Tex Config
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats = 'dvi,pdf,ps'

"Start Flake8 Plugin
" autocmd BufWritePost *.py call Flake8()

"YouCompleteMe UltiSnip Tab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
