source ~/.vim/plugins

set nocompatible
syntax enable
filetype plugin indent on
runtime macros/matchit.vim

if has("termguicolors")
  set termguicolors
endif

" let g:rehash256 = 1
colorscheme palenight
let g:airline_theme='palenight'

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

set spelllang=en_nz " In this house we write NZ English
set nospell " Don't check spelling by default

set colorcolumn=80 " Set a dark grey column
hi ColorColumn ctermbg=darkgrey
set synmaxcol=200 " Reduce the max line length for syntax highlighting
set nowrap " Don't wrap lines by default
set showmatch " Show matching bracket under cursor
set mat=2 "How many tenths of a second to blink
set timeoutlen=500 " Time out map sequences slightly quicker

" Loudly point out trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Window Heights
set helpheight=10

" Always show status bar
set laststatus=2

" Disable all gui options and use console dialogs
set guioptions=c

scriptencoding utf-8                    " UTF8 All day, every day
set directory=/tmp/                     " Set temporary directory (don't litter local dir with swp/tmp files)

" Set it to internal VIM Help
set keywordprg=:help

if v:version >= 703
  " Set undofile.
  set undofile
  let &undodir=&directory
endif

set vb t_vb=                            " Disable visual bell
set autoread                            " Set to auto read when a file is changed from the outside
set nobackup                            " Do not create backup files when saving over existing files
set nowritebackup                       " A little paranoid, but disable the writebackup function as well
set noswapfile                          " No swap files when editing please

" Ignore case on insert completion
set infercase
set matchpairs+=<:>                     " Also match angle brackets

" use indents of 2 spaces, and have them copied down lines:
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Round indent by a multiple of shiftwidth in indent mode
set shiftround

set number
set numberwidth=3                       " Set line number column width

" WindowAndBufferManagement
set splitbelow                          " Open new horizontal split windows below current
set splitright                          " Open new vertical split windows to the right

" WildMenuModeConfig
set nowildmenu                         " Disable the wild menu
set wildmode=list:longest,full         " Better completion
set wildignore=.svn,CVS,.git           " Ignore VCS files
set wildignore+=*.o,*.a,*.so           " Ignore compiled binaries
set wildignore+=*.jpg,*.png,*.gif      " Ignore images
set wildignore+=*.pdf                  " Ignore PDF files
set wildignore+=*.pyc,*.pyo            " Ignore compiled Python files
set wildignore+=*.fam                  " Ignore compiled Falcon files

" Search
set incsearch                           " Incrementally highlight search match
set nohlsearch                          " Don't highlight search result.
set wrapscan                            " Searches wrap around the end of the file
set ignorecase                          " Ignore case in searches...
set smartcase                           " ... unless there's an upper case letter


"""""""""""""""""""""""
" General Key Mappings
"""""""""""""""""""""""

" Map Leader: Reset from \ to ,
let mapleader = ","

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Use `co` for quick changing settings
nmap co =o

" Quick toggle for paste mode
nnoremap cop :<c-u>set paste!<cr>:set paste?<cr>

" ExitInsertMode: Alternative keybinding
imap jj <Esc>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" open new tabs wtih ^t
nmap <C-t> :tabnew<CR>

"for vimgrep next and previous result
nmap <c-Down> :cn<CR>
nmap <c-Up> :cp<CR>

" shortcuts for 3-way merge
map <leader>1 :diffget LOCAL<CR>
map <leader>2 :diffget BASE<CR>
map <leader>3 :diffget REMOTE<CR>


"""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""

" configure ack.vim to use the silver searcher, if present
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!


" Common setting for ruby debug
let g:ruby_debugger_default_script = 'script/rails s'
let g:ruby_debugger_spec_path = 'rspec'         " set Rspec path

au BufRead,BufNewFile *.md setf markdown
au BufRead,BufNewFile *.hbs setf html


" Terraform
let g:terraform_remap_spacebar=1


" Rspec.vim mappings
" Run !rspec on the current file
"nnoremap <silent> <leader>R :exec '!rspec --color %'<CR>
let g:rspec_command = "!bundle exec rspec --color {spec}"
autocmd FileType ruby map <leader>r :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <leader>a :call RunAllSpecs()<CR>


" Ignore common globs that aren't really helpful most of the time
set wildignore+=*/spec/reports/**
set wildignore+=*/node_modules/**
set wildignore+=*/**/*.lock
set wildignore+=*/bin/**
set wildignore+=*/tmp/**
set wildignore+=*/neo4j/**
set wildignore+=*/solr/**


" FZF
nmap // :BLines!<CR>
nmap ?? :Rg!<CR>
nmap <C-p> :Files!<CR>


" ALE configuration
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" TypeScript key mapping
autocmd FileType typescript nmap <buffer> <leader>t : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescriptreact nmap <buffer> <leader>t : <C-u>echo tsuquyomi#hint()<CR>
