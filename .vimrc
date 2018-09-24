"adam rogerson vimrc started on Jan 24 2016 after the death of my old computer/vimrc  
    "rip ??/??/???? - Jan 23 2016

execute pathogen#infect()

"normal stuff
"-------------------------------------------------------------------------
"
syntax on
set nocompatible
let mapleader = "\<Space>"
set expandtab
set tabstop=4
set shiftwidth=4
set number
set spell spelllang=en_us
set laststatus=2
set incsearch
set smartcase
set wildmenu
set cursorline
set smartindent

" pretty stuff
set t_Co=256
set guifont=Monospace\ 13 
colorscheme badwolf 


" sidebar GUI options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove scroll bar 
set guioptions-=L  "remove scroll bar 

" Netrw settings
let g:netrw_banner = 0
let g:netrw= "right" "fixes everything highlighted bug
let g:netrw_list_hide= '.*\.swp$,.*\.py[co]'
let g:netrw_liststyle=3


" Esay color for diff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red


"Custom Bindings
"-----------------------------------------------------------------------

"allows copy/pasta with normal letters
vmap <Leader>y "+y
vmap <Leader>p "+p
nmap <Leader>p "+p
nmap <Leader>y "+y

"allow move from split with leader and direction 
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>


"buffer fun 
nmap <Tab> :bnext<CR> 

nnoremap q<Tab> :bp\|bd #<CR>
 "kills current buffer and swaps to next one


" saved macros 
"first char gets chopped for some reason
let @p ='iimport pdb;pdb.set_trace()'




"Python stuff
"-----------------------------------------------------------------------

"compile python script with , z 
au BufEnter,BufRead *.py noremap <silent> <leader>z :w !python3 %<CR>

"make color at word 80
au BufEnter,BufRead *.py set colorcolumn=80



"Plugins
"-------------------------------------------------------------------------

"--Bufline------------------------------------------------------------
let g:bufferline_show_bufnr = 0
let g:bufferline_solo_highlight = 0
let g:bufferline_show_bufnr = 0



