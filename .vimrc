execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set nu

set colorcolumn=80
set tw=80

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap

" color desert
set t_Co=256
color wombat256mod
highlight ColorColumn ctermbg=233

nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f :TlistToggle<CR>

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
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>Q :qall<CR> 
nnoremap <Leader>e :wq<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>r :SCCompileRun<CR>

vnoremap <Leader>s :sort<CR>

" vnoremap < <gv
" vnoremap > >gv


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Toggles
nnoremap <Leader>n :set invnumber<CR>
set pastetoggle=<Leader>p
nnoremap <Leader>h :set hlsearch! hlsearch?<CR>

" TODO: Resize windows -- don't know how to do this yet.. ideal, way: A Function
" Key to trigger resize mode, then can just resize using h/j/k/l; F3 again to
" off it.

" easier moving between tabs
noremap <c-u> :tabprevious<CR>
noremap <c-o> :tabnext<CR>


" Disable Swap Files
set nobackup
set nowritebackup
set noswapfile

" CtrlP Settings
let g:ctrlp_max_height = 30
set wildignore+=*.pyc,*_build/*,*/coverage/*

" Folding
nnoremap <Space> za

" Turn off code checking
let g:pymode_lint = 0


" Search Related
set incsearch

au BufNewFile,BufRead *.md set filetype=markdown

" Remove cpp key-words
let java_allow_cpp_keywords = 0 
au BufNewFile,BufRead *.ejs set filetype=html

set shell=bash\ -l
