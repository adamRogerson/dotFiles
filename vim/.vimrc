"adam rogerson vimrc started on Jan 24 2016 after the death of my old
"computer/vimrc  
"rip ???? - Jan 23 2016

execute pathogen#infect()

"===========================================================================
"====================== Basics =============================================
"===========================================================================

syntax on
set nocompatible
let mapleader = "\<Space>"
set expandtab
set tabstop=4
set shiftwidth=4
set number
set spell spelllang=en_us
set wildmenu
set scrolloff=1


" search related
set incsearch
set smartcase
set ignorecase


" pretty stuff
set t_Co=256
set guifont=Monospace\ 12 
colorscheme badwolf

if &term =~# '256color' && ( &term =~# '^screen'  || &term =~# '^tmux' )
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif


" Status line
set laststatus=2 
set statusline+=%n:
set statusline+=%<%f
set statusline+=%h%m%r%=%-14.(%l,%c%V%)\ %P


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
let g:netrw_winsize = 25


"Custom Generic Highlights 
highlight red cterm=bold ctermbg=darkred guibg=darkred
highlight green cterm=bold ctermbg=darkgreen guibg=darkgreen
highlight blue cterm=bold ctermbg=darkblue guibg=darkblue

"===========================================================================
"====================== Macros and custom Bindings =========================
"===========================================================================

"first char gets chopped for some reason
let @p ='iimport pdb;pdb.set_trace()'

"allow move from split with leader and direction 
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"Open lex 
nnoremap <Leader>e :Lex <CR>

nnoremap <Leader>] :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <Leader>[ :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>


"===========================================================================
"============================= Plugins =====================================
"===========================================================================

"--Bufline---------------------------------------------------
let g:bufferline_show_bufnr = 0
let g:bufferline_solo_highlight = 0
let g:bufferline_show_bufnr = 0

"Tab opens next buffers  
nmap <Tab> :bnext<CR> 

"kills current buffer and swaps to next one
nnoremap q<Tab> :bp\|bd #<CR>
map <Leader>b :ls<CR>:b<space>

"diable tab overriding
let g:vimwiki_key_mappings = { 'VimwikiNextLink' : 0, 'VimwikiPrevLink': 0 }

"===========================================================================
"============================= File specific ===============================
"===========================================================================

"Python stuff ----------------------------------------------

"compile python script with , z 
au BufEnter,BufRead *.py noremap <silent> <leader>z :w !python3 %<CR>

"make color at word 100
au BufEnter,BufRead *.py set colorcolumn=110


"Rust stuff  ----------------------------------------------
au BufEnter,BufRead *.rs set colorcolumn=110
"autocmd BufWritePost *.rs 
"set NeomakeProject cargo

"let s:quitting = 0
"au QuitPre *.rs let s:quitting = 1
"au BufEnter *.rs let s:quitting = 0
"au BufWritePost *.rs if ! s:quitting | Neomake | else | echom "Neomake disabled"| endif
"let g:neomake_warning_sign = {'text': '?'}

"Jenkins stuff ----------------------------------------------
autocmd BufRead,BufNewFile *[jJ]enkins* set syntax=groovy 

"Sh ---------------------------------------------------------
au BufEnter,BufRead *.sh set nonu 

"Make -------------------------------------------------------
"autocmd BufRead,BufNewFile *[Mm]ake* set noet 

"YAML
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 "expandtab

"Puppet
au BufRead,BufNewFile *.pp setfiletype puppet

"Wiki
au BufEnter,BufRead *.wiki set paste 
au BufEnter,BufRead *.wiki set nonu 
let g:vimwiki_key_mappings = { 'VimwikiNextLink' : 0, 'VimwikiPrevLink': 0 }


"===========================================================================
"====================== Custom Functions ===================================
"===========================================================================

"Redir runs a shell command and puts the output in a scratch file 
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

"Plugin doohicky
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
