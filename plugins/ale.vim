Plug 'dense-analysis/ale'

" Yanked from Gary. Kill all LSPs if they get confused.
nnoremap g0 :ALEStopAllLSPs<cr>

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_set_highlights = 0
let g:ale_linters = {
      \ 'javascript': ['prettier'],
      \ 'terraform': ['terraform'],
      \ 'typescript': ['tsserver', 'eslint'],
      \ 'typescriptreact': ['tsserver', 'eslint']
      \ }

let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'python': ['black'],
      \ 'terraform': ['terraform'],
      \ 'typescript': ['prettier'],
      \ 'typescriptreact': ['prettier']
      \ }

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_javascript_eslint_executable = 'eslint --cache'
let g:ale_set_signs = 0
let g:ale_set_highlights = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
