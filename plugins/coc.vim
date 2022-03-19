Plug 'neoclide/coc.nvim', { 'branch': 'release' }

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-pyright',
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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
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
nnoremap <leader>fs :silent Prettier<CR>

nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rr <Plug>(coc-rename)

" quickfix current focused problem
nnoremap <leader>qf :CocAction<CR>

" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
