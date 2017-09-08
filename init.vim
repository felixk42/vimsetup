set nocompatible              " be iMproved, required
set smartindent
filetype off                  " required
" set termguicolors

filetype plugin indent on    " required

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json'
Plug 'vim-syntastic/syntastic'
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
Plug 'Valloric/MatchTagAlways'

call plug#end()

let g:prettier#config#semi='false'



let g:mta_filetypes = {
    \ 'html': 1,
    \ 'js': 1,
    \ 'jsx': 1
    \}

let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

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
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

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
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim

autocmd FileType javascript setlocal omnifunc=tern#Complete


let g:formatter_yapf_style = 'eslint'
