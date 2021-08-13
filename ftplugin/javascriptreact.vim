let b:ale_fixers = ['prettier']

autocmd FileType javascriptreact nmap <leader>r :!npm run test --findRelatedTests %<CR>
autocmd FileType javascriptreact nmap <leader>a :!npm run test<CR>
