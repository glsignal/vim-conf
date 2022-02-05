Plug 'Quramy/tsuquyomi'

" Vim-ale handles TypeScript quickfix, so tell Tsuquyomi not to do it.
let g:tsuquyomi_disable_quickfix = 1

autocmd FileType typescript,typescriptreact map <buffer> <leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript,typescriptreact map <buffer> <leader>f :TsuSignatureHelp<CR>
autocmd FileType typescript,typescriptreact map <buffer> <leader>qf :TsuQuickFix<CR>
autocmd FileType typescript,typescriptreact map <buffer> <leader>d :TsuDefinition<CR>
autocmd FileType typescript,typescriptreact map <buffer> <leader>D :TsuTypeDefinition<CR>
