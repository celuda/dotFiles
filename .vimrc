execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set nowrap
set ruler

set colorcolumn=80
set tw=80

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" color desert
set t_Co=256
color wombat256mod
highlight ColorColumn ctermbg=233

nnoremap <silent> <F9> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
set pastetoggle=<F2>

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ L%l:C%c


autocmd! bufwritepost .vimrc source %

" File Type Fix for prolog
autocmd BufNewFile,BufRead *.pl set filetype=prolog

let mapleader = ","
" Quick quit command
nnoremap <Leader>q :quit<CR>  " Quit current window
nnoremap <Leader>e :wq<CR>    " Save and quite current window
nnoremap <Leader>w :update<CR>" Make a save

vnoremap <Leader>s :sort<CR>

vnoremap < <gv
vnoremap > >gv


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

noremap <F1> :set invnumber<CR>

" TODO: 
" Resize windows -- don't know how to do this yet.. ideal, way: 
"   F3 to trigger resize mode, then can just resize using h/j/k/l; F3 again to
"   off it.

" easier moving between tabs
noremap <c-u> :tabprevious<CR>
noremap <c-o> :tabnext<CR>


" Disable Swap Files
set nobackup
set nowritebackup
set noswapfile


noremap Q gq
noremap Q gqap


" CtrlP Settings
let g:ctrlp_max_height = 30
set wildignore+=*.pyc,*_build/*,*/coverage/*
