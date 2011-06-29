set nocompatible
set nobackup
nnoremap ; :
let mapleader = ','
syntax on

fun SetupVAM()
	set runtimepath+=~/.vim/addons/vim-addon-manager
	" commenting try .. endtry because trace is lost if you use it.
	" There should be no exception anyway
	" try
	call vam#ActivateAddons(['snipmate-snippets','vim-latex','Command-T','Color_Sampler_Pack','The_NERD_tree'], {'auto_install' : 0})
	" pluginA could be github:YourName see vam#install#RewriteName()
	" catch /.*/
	"  echoe v:exception
	" endtry
endf
call SetupVAM()
" experimental: run after gui has been started (gvim) [3]
" option1:  au VimEnter * call SetupVAM()
" option2:  au GUIEnter * call SetupVAM()
" See BUGS sections below [*]

"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" can switch to other buffer if current buffer is modified
set hidden

set dy=lastline

" use :cd %:h instead
"if exists('+autochdir')
"	set autochdir
"endif

set textwidth=78
set ts=4
set backspace=indent,eol,start
"set number " for line number
set sw=4
set smarttab
set showmatch
"" expand tab but not for makefiles
"set et
"autocmd BufNewFile,BufRead Makefile :set noet

set fileencodings=utf-8,gbk,ucs-bom,latin1

if &t_Co == 256 || has("gui_running")
	colorscheme xoria256
endif

set guioptions+=aAce

set cindent
set formatoptions=tcqn
set cino=g0:0

set incsearch
set hlsearch
"clear highlighted search
nmap <silent> ,/ :nohlsearch<cr>

"set guitablabel=%N\ %f

" for gui
if has('mac')
    set guifont=Menlo\ Regular:h12
else
    set guifont=Monospace\ 10
endif

set laststatus=2
"set statusline=%n\ %1*%h%f%*\ %=%<[%3lL,%2cC]\ %2p%%\ 0x%02B%r%m
set statusline=%-3.3n%f\[%{strlen(&ft)?&ft:'none'}]%=%-14(%l,%c%V%)%<%P

au BufNewFile,BufRead *.r setf r
au BufNewFile,BufRead *.r set syntax=r

set incsearch
set smartcase

set list
set listchars=tab:▸\ 

" format paragraph
nnoremap <leader>q gqip
" select previously pasted stuff
nnoremap <leader>v V`]
" create vertical split and switch to that window
nnoremap <leader>w <C-w>v<C-w>l
" move around
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

filetype plugin on
"set shellslash
filetype indent on

au filetype tex set sw=2 ts=2

"let g:tex_flavor = 'pdflatex'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_MultipleCompileFormats='pdf'

au FileType c,cpp set sw=4 ts=4 et cindent cino=g0:0 fo=tcroqn
