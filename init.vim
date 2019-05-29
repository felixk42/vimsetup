set nocompatible              " be iMproved, required
set smartindent
filetype off                  " required
" set termguicolors

filetype plugin indent on    " required

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/anaconda3/bin/python'

call plug#begin('~/.nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json'
Plug 'Raimondi/delimitMate'
Plug 'mileszs/ack.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
" Plug 'feix760/autospace.vim'
" Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'albertorestifo/github.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'zchee/deoplete-jedi'
call plug#end()

" neomake
let g:neomake_open_list=2

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_jsx_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_list_height=10

if findfile('.eslintrc.json', '.;') !=# ''
  " let g:neomake_javascript_enabled_makers = ['eslint']
  " let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

  let g:neomake_javascript_eslint_args = ['--ignore-pattern', '!.eslintrc.*', '-f', 'compact']
endif

au BufReadPost * Neomake
au BufWritePost * Neomake

" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 100)

let g:prettier#config#semi='false'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#single_quote = 'true'

let g:mta_filetypes = {
    \ 'html': 1,
    \ 'js': 1,
    \ 'jsx': 1
    \}

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#timeout = 1

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

inoremap <expr><Down>    pumvisible() ?   "\<C-n>"  : "\<Down>"
inoremap <expr><Up>    pumvisible() ?   "\<C-p>"  : "\<Up>"


let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_request_timeout = 1


syntax on
set incsearch
set hlsearch
set backspace=start,eol,indent
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <F1> :Autoformat<CR>
nnoremap <F4> :TernRename<CR>
nnoremap <F6> :SyntasticToggleMode<CR>
nnoremap <F7> :Ack 

" vim-javascript
let g:javascript_plugin_jsdoc = 1

set conceallevel=0

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red ctermbg=red

colorscheme monokai

" highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\S\zs\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\S\zs\s\+$/

" autocmd BufWinLeave * call clearmatches()

" Nerdcommenter
"map <F9> <plug>NERDComToggleComment

" Syntastic / ESLint
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
"
"
"

let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:jsx_ext_required = 0

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Hook us up to the system clipboard
set clipboard=unnamed

let g:vim_json_syntax_conceal = 0

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:NERDTreeWinPos = 'left'

" NERDcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" autocmd FileType javascript set formatprg=prettier\ --single-quote\ --no-semi\ --stdin
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
"

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim

autocmd FileType javascript setlocal omnifunc=tern#Complete


let g:formatter_yapf_style = 'eslint'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set tabstop=2 softtabstop=4 expandtab shiftwidth=2 smarttab
