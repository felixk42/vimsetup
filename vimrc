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
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'helino/vim-json'
Plugin 'mileszs/ack.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'jreybert/vimagit'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'feix760/autospace.vim'

" All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required

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

" Ycm remaps
nnoremap <F5> :YcmCompleter GoToDefinition
nnoremap <F4> :YcmCompleter RefactorRename 
nnoremap <F6> :SyntasticToggleMode<CR>
nnoremap <F7> :Ack 

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_return = "⇚"

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
