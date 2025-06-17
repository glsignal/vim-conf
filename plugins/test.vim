Plug 'vim-test/vim-test'

let test#enabled_runners = ["ruby#rspec", "python#pytest", "javascript#vitest", "javascript#jest"]

let test#ruby#rspec#executable = "bundle exec rspec --color"
let test#python#runner = "pytest"
let test#python#pytest#options = "--condensed-warnings --color=yes --reuse-db"
let test#javascript#jest#executable = "npx jest"
" let test#javascript#vitest#executable = "npx vitest -c vitest/vitest.config.mts"

function! DebugNearest()
  let g:test#javascript#jest#executable = "npx vitest --runInBand"
  TestNearest
  unlet g:test#javascript#jest#executable
endfunction

nmap <leader>tf :TestFile<CR>
nmap <leader>tn :TestNearest<CR>
nmap <leader>tN :call DebugNearest()<CR>
nmap <leader>ta :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tg :TestVisit<CR>
