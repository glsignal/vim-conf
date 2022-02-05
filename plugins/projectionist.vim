Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \   "Gemfile": {
    \     "app/**/*.rb": {
    \       "type": "source",
    \       "alternate": "spec/{dirname}/{basename}_spec.rb",
    \     },
    \   },
    \   "package.json": {
    \     "*.js": {
    \       "type": "source",
    \       "alternate": ["{}.test.js", "{}.test.jsx"],
    \     },
    \     "*.jsx": {
    \       "type": "source",
    \       "alternate": ["{}.test.js", "{}.test.jsx"],
    \     },
    \     "*.test.js": {
    \       "type": "test",
    \       "alternate": ["{}.js", "{}.jsx"],
    \     },
    \     "*.test.jsx": {
    \       "type": "test",
    \       "alternate": ["{}.js", "{}.jsx"],
    \     },
    \     "*.ts": {
    \       "type": "source",
    \       "alternate": ["{}.test.ts", "{}.test.tsx"],
    \     },
    \     "*.tsx": {
    \       "type": "source",
    \       "alternate": ["{}.test.ts", "{}.test.tsx"],
    \     },
    \     "*.test.ts": {
    \       "type": "test",
    \       "alternate": ["{}.ts", "{}.tsx"],
    \     },
    \     "*.test.tsx": {
    \       "type": "test",
    \       "alternate": ["{}.ts", "{}.tsx"],
    \     },
    \   }
    \ }
