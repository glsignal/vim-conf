source ~/.vim_plugins

call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-syntastic/syntastic'
Plug 'tomtom/tlib_vim'
Plug 'mileszs/ack.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'roman/golden-ratio'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-markdown'
Plug 'avdgaag/vim-phoenix'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user'
Plug 'mhartington/oceanic-next'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-unimpaired'
call plug#end()

set nocompatible
syntax enable
filetype plugin indent on
runtime macros/matchit.vim

if (has("termguicolors"))
set termguicolors
endif

colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" Terraform
let g:terraform_remap_spacebar=1

" Latex suite
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf,bib'
" let g:tex_flavor='pdflatex'
" let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'

" Reduce the max line length for syntax highlighting
set synmaxcol=300

" Lazily redraw the screen
" set lazyredraw

" Ignore case in searches
set ignorecase
set smartcase

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

set colorcolumn=80                      " Set a dark grey column
hi ColorColumn ctermbg=darkgrey

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

" WindowAndBufferManagement:

set splitbelow                          " Open new horizontal split windows below current
set splitright                          " Open new vertical split windows to the right

" WildMenuModeConfig:

set nowildmenu                         " Disable the wild menu
set wildmode=list:longest,full         " Better completion
set wildignore=.svn,CVS,.git           " Ignore VCS files
set wildignore+=*.o,*.a,*.so           " Ignore compiled binaries
set wildignore+=*.jpg,*.png,*.gif      " Ignore images
set wildignore+=*.pdf                  " Ignore PDF files
set wildignore+=*.pyc,*.pyo            " Ignore compiled Python files
set wildignore+=*.fam                  " Ignore compiled Falcon files

" Search:

" show the `best match so far' as search strings are typed:
set incsearch

" Don't highlight search result.
set nohlsearch

" Searches wrap around the end of the file
set wrapscan

" Tags:

" Perform binary tag search (vs linear) in case tags aren't sorted to avoid
" missing tags
set notagbsearch

" Show extra information when using tags in insert mode
set showfulltag


" Window Heights:

set helpheight=10
" Always show status bar
set laststatus=2

" set statusline=\ "
" set statusline+=%f\ " file name
" set statusline+=[
" set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
" set statusline+=]
" set statusline+=%h%1*%m%r%w%0* " flag
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%= " right align
" "set statusline+=%{ruby_debugger#statusline()}
" "set statusline+=%{rvm#statusline()}\ "
" set statusline+=%{fugitive#statusline()}\ "
" "set statusline+=%-8.(%l,%c%V%)\ %<%P " offset

" hi statusline ctermbg=darkgray

" Map Leader: Reset from \ to ,
let mapleader = ","

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Quick toggle for paste mode
nnoremap cop :<c-u>set paste!<cr>:set paste?<cr>

" ExitInsertMode: Alternative keybinding
imap jj <Esc>
imap kk <Esc>

" Don't wrap lines by default
set nowrap

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Common setting for ruby debug
let g:ruby_debugger_default_script = 'script/rails s'
let g:ruby_debugger_spec_path = 'rspec'         " set Rspec path

nnoremap <C-W>V :vertical bo split<CR>

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

set spelllang=en_nz
set spell

"""""""""""""""""""""""""""""
"for tabn tabp
"tab navigation like firefox
"""""""""""""""""""""""""""""
nmap <C-Left> :tabprevious<CR>
nmap <C-Right> :tabnext<CR>
nmap <C-t> :tabnew<CR>
"nmap <C-w> :tabclose<CR> ”not good...

"for vimgrep next and previous result
nmap <c-Down> :cn<CR>
nmap <c-Up> :cp<CR>

au BufRead,BufNewFile *.md setf markdown
au BufRead,BufNewFile *.hbs setf html

" Rspec.vim mappings
" Run !rspec on the current file
"nnoremap <silent> <leader>R :exec '!rspec --color %'<CR>
let g:rspec_command = "!bundle exec rspec --color {spec}"
autocmd FileType ruby map <leader>r :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <leader>a :call RunAllSpecs()<CR>

" Run specs in js files with ,t
autocmd FileType javascript map <buffer> <leader>t :execute  "!npm test"<CR>

"""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

"""""""""""""""""""""""
" Ctrl-P's ignore
"""""""""""""""""""""""
set wildignore+=*/spec/reports/**
set wildignore+=*/node_modules/**
set wildignore+=*/**/*.lock
set wildignore+=*/bin/**
set wildignore+=*/tmp/**
set wildignore+=*/neo4j/**
set wildignore+=*/solr/**
