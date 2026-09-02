Plug 'neoclide/coc.nvim', { 'branch': 'release' }

let g:coc_config_home = "$HOME/.vim"

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ ]

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" make highlighted text a little more obvious
autocmd User PlugLoaded ++nested highlight CocHighlightText
  \ term=bold,underline
  \ cterm=bold,underline ctermbg=238
  \ gui=bold,underline

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


"""""""""""""""""""""""
" Key bindings
"""""""""""""""""""""""

" restart lang servers when they get confused
nnoremap g0 :silent :CocRestart<CR>
" close all floating windows when coc-vim fucks up
nnoremap g9 :silent :call coc#float#close_all()<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>

" format syntax
nmap <leader>fs <Plug>(coc-format)

nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rr <Plug>(coc-rename)

" quickfix current focused problem
nmap <silent> <leader>qf <Plug>(coc-codeaction)

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space>
         \ coc#pum#visible() ? coc#pum#next(1) :
         \ coc#refresh()
else
  inoremap <silent><expr> <c-@>
         \ coc#pum#visible() ? coc#pum#next(1) :
         \ coc#refresh()
endif
