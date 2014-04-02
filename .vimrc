execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set nowrap
set ruler

set colorcolumn=80
set tw=79

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
vnoremap <Leader>s :sort<CR>
vnoremap < <gv
vnoremap > >gv

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa<CR>    " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
noremap <C-n> <esc>:tabprevious<CR>
noremap <C-m> <esc>:tabnext<CR>

" Disable Swap Files
set nobackup
set nowritebackup
set noswapfile


noremap Q gq
noremap Q gqap


" CtrlP Settings
let g:ctrlp_max_height = 30
set wildignore+=*.pyc,*_build/*,*/coverage/*
noremap <C-o> <esc>:CtrlP<CR>
