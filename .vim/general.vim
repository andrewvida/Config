" ******************************************************************************
" COLORSCHEME
" ******************************************************************************

" the color sheme, dumbass
colorscheme default
set background=dark

" enable color syntax highlighting
syntax on

" change the background color of the autocomplete menu
highlight Pmenu ctermbg=172 gui=bold

" change the select backgroud color of the autocomplete menu
highlight PmenuSel ctermbg=92 gui=bold

" change the sign column backgroud color
highlight SignColumn ctermbg=black

" ******************************************************************************
" BASICS
"
" Oh, behave...
" ******************************************************************************

" update the file if it's been changed externally
set autoread

" allow backspacing in insert mode
set backspace=indent,eol,start

" turn off the error bells
set belloff=all

" allow clipboard access
set clipboard=unnamed

" add auto select
set completeopt=noinsert,preview,menuone

" current line highlight details
highlight cursorline cterm=none

" higlight columns past 80
" execute "set colorcolumn=" . join(range(121,335), ',')

" allow hidden buffers instead of closing
set hidden

" show the line number
set number

" set omnifunc
set omnifunc=syntaxcomplete#Complete

" use the legacy regex engine - improves ruby syntax highlighting performance
set regexpengine=1

" scroll buffer
set scrolloff=10

" set the sign column to be visible
set signcolumn=yes

" set the shell - this works for bash
set shell=/bin/bash

"Remove splash screen
set shortmess+=I

" shows selected lines
set showcmd

" jumps to matching brackets
set showmatch

" ******************************************************************************
" BACKUP FILES
"
" Don't let VIM do this...
" ******************************************************************************

" no swapfiles
set noswapfile

" no backup files
set nobackup

" no backup files for editing
set nowritebackup

" ******************************************************************************
" COMPLETION
" ******************************************************************************

" allows command line completion
set wildmenu

" command line expansion options
set wildmode=list:longest,full

" ignore from completion
set wildignore=*.git,bundle

" ******************************************************************************
" CURSOR
"
" OSX iTerm2 Specific
" ******************************************************************************

" change the cursor shape in edit mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" OSX Terminal Specific
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"

" ******************************************************************************
" FONT
" ******************************************************************************

" italic comments
highlight htmlarg cterm=italic

" bold html arguments
highlight comment cterm=italic

" ******************************************************************************
" SEARCH
" ******************************************************************************

" set line substiution to global by default
set gdefault

" highlight search matches
set hlsearch

" ignore case when searching
set ignorecase

" underline search matches
hi Search cterm=underline

" search is case-insensitive if lowercase, case-sensitive otherwise
set smartcase

" ******************************************************************************
" STATUS LINE
" ******************************************************************************

" show the status line
set laststatus=2

" ******************************************************************************
" LISTCHARS
" ******************************************************************************

" set list characters
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸▸

" ******************************************************************************
" NUMBERING
" ******************************************************************************

set norelativenumber

" ******************************************************************************
" TABS
" ******************************************************************************

" use spaces instead of tab
set expandtab

" set width for indentation commands
set shiftwidth=2

" set number of spaces for tab
set softtabstop=2

" ******************************************************************************
" FOLDING
" ******************************************************************************

" turn off folding
set nofoldenable

" ******************************************************************************
" PROJECT-SPECIFIC
" ******************************************************************************

" allow per-project configuration files
set exrc

" prevent bad things in project-specific files
set secure

" ******************************************************************************
" NETRW CONFIGURATION
" ******************************************************************************

" don't set netrw as the altfile
let g:netrw_altfile = 1

" hide the banner because it's useless
let g:netrw_banner = 0

" set list style
let g:netrw_liststyle = 3

" ******************************************************************************
" TERMINAL CONFIGURATION
" ******************************************************************************

augroup terminal
  autocmd!
  autocmd BufWinEnter *
        \ if &buftype == 'terminal' |
        \   setlocal nonumber norelativenumber |
        \ endif
augroup end
