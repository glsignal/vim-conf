let b:ale_fixers = ['prettier']

autocmd FileType typescriptreact nmap <leader>r :!npm run test -- --findRelatedTests %<CR>
autocmd FileType typescriptreact nmap <leader>a :!npm run test<CR>
