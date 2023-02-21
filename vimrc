set nocompatible
syntax enable
filetype plugin on
filetype plugin indent on
runtime macros/matchit.vim
scriptencoding utf-8                    " UTF8 All day, every day

if has("termguicolors")
  set termguicolors
endif

if has("nvim")
  let g:loaded_ruby_provider = 0
  let g:loaded_node_provider = 0
  let g:loaded_perl_provider = 0
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif
set vb t_vb=                            " Disable visual bell

set spelllang=en_nz
set nospell

set updatetime=500
set nowrap                              " Don't wrap lines by default
set showmatch                           " Show matching bracket under cursor
set mat=2                               " How many tenths of a second to blink
set timeoutlen=500                      " Time out map sequences slightly quicker
set cursorline                          " highlight the currently focused line
set backspace=indent,eol,start          " make backspace work as in most other editors
set synmaxcol=200                       " Reduce the max line length for syntax highlighting
set laststatus=2                        " Always show status bar
set guioptions=c                        " Disable all gui options and use console dialogs

set nobackup                            " Do not create backup files when saving over existing files
set nowritebackup                       " A little paranoid, but disable the writebackup function as well
set noswapfile                          " No swap files when editing please
set directory=/tmp/                     " Set temporary directory (don't litter local dir with swp/tmp files)
if v:version >= 703
  set undofile
  let &undodir=&directory
endif

set number
set numberwidth=3                       " Set line number column width

set colorcolumn=80                      " Set a dark grey column
hi ColorColumn ctermbg=darkgrey

" set keywordprg=:help
set helpheight=10

set autoread                            " Set to auto read when a file is changed from the outside
set infercase                           " Ignore case on insert completion
set matchpairs+=<:>                     " Also match angle brackets

" use indents of 2 spaces, and have them copied down lines:
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

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

" Search
set incsearch                           " Incrementally highlight search match
set nohlsearch                          " Don't highlight search result.
set wrapscan                            " Searches wrap around the end of the file
set ignorecase                          " Ignore case in searches...
set smartcase                           " ... unless there's an upper case letter

" Ignore common globs that aren't really helpful most of the time
set wildignore+=*/spec/reports/**
set wildignore+=*/node_modules/**
set wildignore+=*/**/*.lock
set wildignore+=*/bin/**
set wildignore+=*/tmp/**
set wildignore+=*/neo4j/**
set wildignore+=*/solr/**

"""""""""""""""""""""""
" General Key Mappings
"""""""""""""""""""""""
let mapleader = ","

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Quick toggle for paste mode
nnoremap cop :<c-u>set paste!<cr>:set paste?<cr>

" ExitInsertMode: Alternative keybinding
imap jj <Esc>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

"for vimgrep next and previous result
nmap <c-Down> :cn<CR>
nmap <c-Up> :cp<CR>

" Quick map for jumping into pre-filled substitute command
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>
nmap <leader>S :%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>

" Lazygit! https://github.com/jesseduffield/lazygit
nnoremap <leader>g :tab term ++close lazygit<CR>

autocmd BufRead,BufNewFile *.md setf markdown
autocmd BufRead,BufNewFile *.hbs setf html

autocmd FileType json syntax match Comment +\/\/.\+$+

"""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" apply color scheme first, plugins may alter highlights or colours
source ~/.vim/plugins/palenight.vim

source ~/.vim/plugins/ack.vim
source ~/.vim/plugins/airline.vim
" source ~/.vim/plugins/ale.vim
source ~/.vim/plugins/colorizer.vim
source ~/.vim/plugins/editorconfig.vim
source ~/.vim/plugins/fzf.vim
source ~/.vim/plugins/gitgutter.vim
source ~/.vim/plugins/golden-ratio.vim
source ~/.vim/plugins/jsx-pretty.vim
source ~/.vim/plugins/coc.vim
source ~/.vim/plugins/projectionist.vim
source ~/.vim/plugins/quickfix-reflector.vim
" source ~/.vim/plugins/rails.vim
source ~/.vim/plugins/repeat.vim
" source ~/.vim/plugins/rspec.vim
source ~/.vim/plugins/snippets.vim
source ~/.vim/plugins/surround.vim
source ~/.vim/plugins/terraform.vim
source ~/.vim/plugins/test.vim
source ~/.vim/plugins/textobj-rubyblock.vim
source ~/.vim/plugins/textobj-user.vim
source ~/.vim/plugins/textobj-xmlattr.vim
" source ~/.vim/plugins/tsuquyomi.vim
source ~/.vim/plugins/typescript.vim
source ~/.vim/plugins/unimpaired.vim

if has('nvim')
  source ~/.vim/plugins/vimproc.vim
endif

call plug#end()

doautocmd User PlugLoaded

" Loudly point out trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
