"adam rogerson vimrc started on Jan 24 2016 after the death of my old vimrc 
execute pathogen#infect()

"normal stuff
syntax on
set nocompatible
let mapleader=","
set tabstop=4
set shiftwidth=4
set expandtab
set number
set spell spelllang=en_us
set foldcolumn=1


filetype plugin indent on

" Keeps folds after save
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 




" pretty stuff
set t_Co=256
colorscheme minimalist

set guifont=Monospace\ 18 




"short cuts and custom bindings
let mapleader = "\<Space>"

"allows copy/pasta with normal letters
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"compile python script with , z 
nnoremap <silent> <leader>z :!clear;python %<CR>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



"python stuff
set colorcolumn=80

