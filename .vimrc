    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
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
    Bundle 'Syntastic'
    Bundle 'https://github.com/tpope/vim-fugitive'
    Bundle 'scrooloose/nerdtree' 
    Bundle 'flazz/vim-colorschemes'
    Bundle 'tpope/vim-surround'
    Bundle 'snipMate' 
    Bundle 'tComment'
    Bundle 'tpope/vim-rails'
    Bundle 'wavded/vim-stylus'
    Bundle 'hail2u/vim-css3-syntax'
    Bundle 'klen/rope-vim'
    Bundle 'phpvim'
    Bundle 'Lokaltog/powerline'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler enddisable arrows
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
"set line numbers
set number
"Maximize gvim window
if has("gui_running")
    "set font
    set guifont=PragmataPro\ 9
    set lines=999 columns=999
    colorscheme solarized
    set bg=dark
    set guioptions-=T
    set guioptions-=r
else
    " if exists("+lines")
    "     set lines=999
    " " endif
    " " if exists("+columns")
    "     set columns=999
    " endif
    set bg=dark
    colors solarized
endif 
"set tabular
set cindent
set tabstop=2
set shiftwidth=4
set expandtab

"klet NERDTreeQuitOnOpen=1
"insert with one key stroke <Space>
    "set color
"autocmd BufNewFile,BufRead *.styl set filetype=stylus
set laststatus=2
:imap jj <Esc>
:nmap ;; :
