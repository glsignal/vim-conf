Plug 'thoughtbot/vim-rspec'

" Run !rspec on the current file
nnoremap <silent> <leader>R :exec '!rspec --color %'<CR>
let g:rspec_command = "!bundle exec rspec --color {spec}"
autocmd FileType ruby map <buffer> <leader>r :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <buffer> <leader>a :call RunAllSpecs()<CR>
autocmd FileType ruby map <buffer> <leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <buffer> <leader>l :call RunLastSpec()<CR>
