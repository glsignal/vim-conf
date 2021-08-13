let b:ale_fixers = ['prettier']

autocmd FileType javascript nmap <leader>r :!npm run test --findRelatedTests %<CR>
autocmd FileType javascript nmap <leader>a :!npm run test<CR>
