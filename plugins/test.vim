Plug 'vim-test/vim-test'

let test#ruby#rspect#executable = "bundle exec rspec --color"
let test#python#runner = "pytest"
let test#python#pytest#options = "--condensed-warnings --color=yes --reuse-db"
nmap <leader>tf :TestFile<CR>
nmap <leader>tn :TestNearest<CR>
nmap <leader>ta :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tg :TestVisit<CR>
