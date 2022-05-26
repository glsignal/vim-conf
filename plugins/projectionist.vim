Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \   "Gemfile": {
    \     "app/*.rb": {
    \       "alternate": "spec/{}_spec.rb"
    \     },
    \     "app/models/*.rb": {
    \       "type": "model"
    \     },
    \     "app/services/*.rb": {
    \       "type": "service"
    \     },
    \     "app/controllers/*_controller.rb": {
    \       "type": "controller"
    \     }
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
