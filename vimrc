call pathogen#infect()

set nocompatible
syntax on
filetype plugin indent on
runtime macros/matchit.vim

set background=dark

" Latex suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='pdflatex'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'

if has('gui_running')
 set guifont=Menlo:h11
 set antialias
endif

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

set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%{ruby_debugger#statusline()}
"set statusline+=%{rvm#statusline()}\ "
"set statusline+=%{fugitive#statusline()}\ "
set statusline+=%-8.(%l,%c%V%)\ %<%P " offset

function! ToggleFontSize()
  if exists("g:large_font") && g:large_font == 1
    let g:large_font = 0
    set guifont=Menlo:h11
  else
    let g:large_font = 1
    set guifont=Menlo:h15
  end
endfunction

if has("mac") && has('gui_running')
  " Unmap Apple+S to remap to Esc, then :w<CR>
  macmenu &File.Save key=<nop>
  imap <D-s> <Esc>:w<CR>
  map <D-s> :w<CR>
  map <D-H> :call ToggleFontSize()<CR>
end

" Map Leader: Reset from \ to ,
let mapleader = ","

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

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

" Setup Supertab, also :SuperTabHelp
let g:SuperTabDefaultCompletionType = "<c-n>"
set complete=.,w,b,u,i

" .	scan the current buffer ('wrapscan' is ignored)
" w	scan buffers from other windows
" b	scan other loaded buffers that are in the buffer list
" u	scan the unloaded buffers that are in the buffer list
" U	scan the buffers that are not in the buffer list
" k	scan the files given with the 'dictionary' option
" kspell  use the currently active spell checking |spell|
" k{dict}	scan the file {dict}.  Several "k" flags can be given,
" 	patterns are valid too.  For example: >
" 		:set cpt=k/usr/dict/*,k~/spanish
" <	s	scan the files given with the 'thesaurus' option
" s{tsr}	scan the file {tsr}.  Several "s" flags can be given, patterns
" 	are valid too.
" i	scan current and included files
" d	scan current and included files for defined name or macro
" 	|i_CTRL-X_CTRL-D|
" ]	tag completion
" t	same as above

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

set spell spelllang=en_nz
