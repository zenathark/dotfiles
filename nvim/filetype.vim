augroup filetypedetect
	autocmd Filetype gitcommit		setlocal spell tw=72 colorcolumn=73
	au FileType go nmap <leader>t <Plug>(go-test)
	au FileType go nmap <leader>r <Plug>(go-rename)
	au FileType go nmap <leader>s <Plug>(go-coverage)

	autocmd Filetype tex setlocal spell tw=80 colorcolumn=81
	autocmd Filetype text setlocal spell tw=72 colorcolumn=73
	autocmd Filetype markdown setlocal spell tw=72 colorcolumn=73

	autocmd Filetype tex let g:deoplete#enable_at_startup=0
	autocmd Filetype text let g:deoplete#enable_at_startup=0
	autocmd Filetype markdown let g:deoplete#enable_at_startup=0
augroup END
