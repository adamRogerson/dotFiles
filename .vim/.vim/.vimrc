"adam rogerson vimrc started on Jan 24 2016 after the death of my old
"computer/vimrc  
"rip ???? - Jan 23 2016

execute pathogen#infect()

"Basic stuff -----------------------------------------------------------------------------

syntax on
set nocompatible
let mapleader = "\<Space>"
set expandtab
set tabstop=4
set shiftwidth=4
set number
set spell spelllang=en_us
set laststatus=2
set wildmenu
set smartindent
set scrolloff=1

" search 
set incsearch
set smartcase
set ignorecase


" pretty stuff
set t_Co=256
set guifont=Monospace\ 12 
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


"Buffer Stuff--------------------------------------------------------
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"Tab over open buffers  
nmap <Tab> :bnext<CR> 

"kills current buffer and swaps to next one
nnoremap q<Tab> :bp\|bd #<CR>

map <Leader>b :ls<CR>:b<space>


"--Bufline--------------------------------------------------------------------------------
let g:bufferline_show_bufnr = 0
let g:bufferline_solo_highlight = 0
let g:bufferline_show_bufnr = 0


"Macros ----------------------------------------------------------------------------------

"first char gets chopped for some reason
let @p ='iimport pdb;pdb.set_trace()'


"Plugins ---------------------------------------------------------------------------------

"--Bufline------------------------------------------------------------
let g:bufferline_show_bufnr = 0
let g:bufferline_solo_highlight = 0
let g:bufferline_show_bufnr = 0


"Python stuff ----------------------------------------------------------------------------

"compile python script with , z 
au BufEnter,BufRead *.py noremap <silent> <leader>z :w !python3 %<CR>

"make color at word 80
au BufEnter,BufRead *.py set colorcolumn=110


"C stuff ---------------------------------------------------------------------------------

"make color bar at word 110 
au BufEnter,BufRead *.c,*h set colorcolumn=110


if has("cscope")
    set csprg=cscope
    set csto=0
    set cst
    "Non-verbose - remove adding database output
    set nocsverb
    "Add cscope database
    cs add ./cscope.out
endif

func FIND_IN_CSCOPE(arg)
    let a=expand("<cword>")
    if (a:arg == "s")
        exe "cscope find s" a
    elseif (a:arg == "g")
        exe "cscope find g" a
    elseif (a:arg == "c")
        exe "cscope find c" a
    elseif (a:arg == "f")
        exe "cscope find f" a
    elseif (a:arg == "e")
        exe "cscope find e" a
    elseif (a:arg == "i")
        exe "cscope find i" a
    elseif (a:arg == "a")
        exe "cscope find t" a
    endif
endfunction

" Find symbol
map fs :call FIND_IN_CSCOPE("s")<CR>
" Find definition
map fd :call FIND_IN_CSCOPE("g")<CR>
" Find text
map ft :call FIND_IN_CSCOPE("t")<CR>
" Find function calling this function
map fc :call FIND_IN_CSCOPE("c")<CR>
" Find file
map ff :call FIND_IN_CSCOPE("f")<CR>


"--Custom Functions-----------------------------------------------------------------------

"Redir runs a unix command and puts the output in a scratch file 
"Example Redir(!ls)
function! R(cmd)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
	else
		redir => output
		execute a:cmd
		redir END
	endif
	vnew
	let w:scratch = 1
	setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
	call setline(1, split(output, "\n"))
endfunction

command! -nargs=1 -complete=command Redir silent call Redir(<f-args>)
