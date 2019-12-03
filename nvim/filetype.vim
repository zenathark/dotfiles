augroup filetypedetect
	au FileType go nmap <leader>t <Plug>(go-test)
  	au FileType go nmap <Leader>r <Plug>(go-rename)
  	au FileType go nmap <leader>c <Plug>(go-coverage)
augroup END
