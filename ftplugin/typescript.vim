let b:ale_fixers = ['prettier']

autocmd FileType typescript nmap <leader>r :!npm run test --findRelatedTests %<CR>
autocmd FileType typescript nmap <leader>a :!npm run test<CR>
