set nocompatible              " be iMproved, required
set smartindent
filetype off                  " required
" set termguicolors

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'helino/vim-json'
Plugin 'mileszs/ack.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'jreybert/vimagit'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'feix760/autospace.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
" Plugin 'ternjs/tern_for_vim'
Plugin 'Chiel92/vim-autoformat'


" All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required



call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 1

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

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

set conceallevel=1


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red ctermbg=red

colorscheme monokai

"highlight ExtraWhitespace ctermbg=red guibg=red
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

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Hook us up to the system clipboard
set clipboard=unnamed

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:NERDTreeWinPos = 'right'

" NERDcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

autocmd FileType javascript set formatprg=prettier\ --single-quote\ --no-semi\ --stdin
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

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim

autocmd FileType javascript setlocal omnifunc=tern#Complete


let g:formatter_yapf_style = 'eslint'

