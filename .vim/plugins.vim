" ******************************************************************************
" VIM-PLUG
" ******************************************************************************
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestLast', 'TestLast', 'TestSuite'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'honza/vim-snippets'
Plug 'lifepillar/vim-mucomplete'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'ntpeters/vim-airline-colornum'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
call plug#end()

" ******************************************************************************
" ALE
" ******************************************************************************

" add sign column emoticons
let g:ale_sign_warning = "➜"
let g:ale_sign_error = "✘"

" message format
let g:ale_echo_msg_format = '[%linter%]: %s ( %severity% )'

" autofix
let g:ale_fix_on_save = 1

" ale fixers
let g:ale_fixers = {
      \  '*': [
      \   'remove_trailing_lines',
      \   'trim_whitespace',
      \  ],
      \  'javascript': [
      \   'eslint',
      \  ],
      \  'ruby': [
      \   'rubocop',
      \  ],
      \}

" ale colors for highlights
augroup ale_highlights
  autocmd!
  autocmd ColorScheme * highlight ALEError ctermbg=88
  autocmd ColorScheme * highlight ALEErrorSign ctermfg=196
  autocmd ColorScheme * highlight ALEWarning ctermbg=none cterm=underline
  autocmd ColorScheme * highlight ALEWarningSign ctermfg=208
augroup end

" add vim-airline integration
let g:airline#extensions#ale#enabled = 1

" ******************************************************************************
" FZF.VIM
" ******************************************************************************

" map Buffers command
nnoremap <silent> <Leader>b :Buffers<CR>

" map GFiles command
nnoremap <silent> <Leader>t :GFiles<CR>

" map Files command
nnoremap <silent> <Leader>f :Files<CR>

" map Lines command
nnoremap <silent> <Leader>l :Lines<CR>

" map Snippets command
nnoremap <silent> <Leader>s :Snippets<CR>

" map Tags command
nnoremap <silent> <Leader>c :Tags<CR>

" ******************************************************************************
" INDENTLINE
" ******************************************************************************

" changes the indent line character
let g:indentLine_char = '┊'

" exclude json and sh files
let g:indentLine_fileTypeExclude = ['json', 'sh']

" ******************************************************************************
" MUCOMPLETE
" ******************************************************************************

" use the global completeopt
let g:mucomplete#always_use_completeopt = 0

" cycle with tab instead of selection
let g:mucomplete#cycle_with_trigger = 1

imap <right> <plug>(MUcompleteExtendFwd)

" add completion chain
let g:mucomplete#chains = {
      \ 'default' : [
      \    'ulti',
      \    "c-p",
      \    "c-n",
      \    'omni',
      \    'tags',
      \    'incl',
      \    'line',
      \    'file',
      \    'path',
      \   ],
      \ }

" ******************************************************************************
" RAINBOW_PARENTHESES
" ******************************************************************************

" activate immediately
autocmd VimEnter * silent! RainbowParentheses

" add the [] and {}
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" ******************************************************************************
" TABULAR
" ******************************************************************************

if exists(':Tabularize')
  AddTabularPattern! symbols         / :/l0
  AddTabularPattern! hash            /^[^>]*\zs=>/
  AddTabularPattern! chunks          / \S\+/l0
  AddTabularPattern! assignment      / = /l0
  AddTabularPattern! comma           /^[^,]*,/l1
  AddTabularPattern! colon           /:\zs /l0
  AddTabularPattern! options_hashes  /:\w\+ =>/

  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" ******************************************************************************
" TAGBAR
" ******************************************************************************

" toggle tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" hide line numbers
let g:tagbar_show_linenumbers = 0

" ******************************************************************************
" VIM-AIRLINE
" ******************************************************************************

" add fancy glyphs -- requires a powerline font
let g:airline_powerline_fonts = 1

" hide empty trailing sections
let g:airline_skip_empty_sections = 1

" set the airline theme
let g:airline_theme = 'light'

" ******************************************************************************
" VIM-FUGITIVE
" ******************************************************************************

augroup fugitive_quickfix
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup end

" ******************************************************************************
" VIM-TEST
" ******************************************************************************

" mappings
nnoremap <silent> t<C-n> :noautocmd wa<cr> :TestNearest<CR>
nnoremap <silent> t<C-f> :noautocmd wa<cr> :TestFile<CR>
nnoremap <silent> t<C-a> :noautocmd wa<cr> :TestSuite<CR>
nnoremap <silent> t<C-l> :noautocmd wa<cr> :TestLast<CR>

" set the default strategy
let test#strategy = "vimterminal"
