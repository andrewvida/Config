" ******************************************************************************
" COLORSCHEME
" ******************************************************************************

" the color scheme
colorscheme onedark
set background=dark

" enable color syntax highlighting
syntax on

" change comment color
" highlight Comment ctermfg=102

" change the background color of the autocomplete menu
" highlight Pmenu ctermbg=248 gui=bold guibg=cyan

" change the select backgroud color of the autocomplete menu
" highlight PmenuSel ctermbg=109 gui=bold

" change the sign column backgroud color
" highlight SignColumn ctermbg=black
"

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" embedded lua highlighting, for lua, python, and ruby
 let g:vimsyn_embed = 'lPr'

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
set completeopt=preview,menuone,noinsert

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

" the updatetime default is too slow
set updatetime=300

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

" " ******************************************************************************
" " FONT
" " ******************************************************************************

" " bold comments
" highlight comment cterm=italic gui=italic

" " bold html arguments
" highlight htmlarg cterm=italic gui=italic

" ******************************************************************************
" SEARCH
" ******************************************************************************

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
