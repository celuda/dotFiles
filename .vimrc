execute pathogen#infect()
syntax on
filetype plugin indent on
set nu
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
color desert

nnoremap <silent> <F9> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ L%l:C%c

autocmd BufNewFile,BufRead *.pl set filetype=prolog

set colorcolumn=80

set nobackup
set nowritebackup
set noswapfile
