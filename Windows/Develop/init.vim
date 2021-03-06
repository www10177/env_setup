" Setting for gvim
set guifont=Consolas:h18:cANSI
set mouse=c
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set nocompatible

"set secure
set backspace=2         " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more " than 50 lines of registers set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time

set expandtab          " expand tabs to spaces.
set wildchar=<TAB>      " such as <TAB> in shell
set smarttab
set tabstop=4
set shiftwidth=4

set cindent 			" auto indent
set nu 					" Show the number of line
set t_Co=256            " number of colors
set showcmd             " show command
set showmode            " show current mode
set incsearch           " While typing a search pattern, show immediately 
                        " where the so far typed pattern matches.
set hlsearch            " When there is a previous search pattern, 
                        " highlight all its matches.
syntax on               " show parts of the text in another font or color

set cursorline 			" underline where the cursor 
set foldmethod=marker   " set {{ { and  }} } to fold automatically
set fileencodings=utf-8,cp936,big5,latin1
set background=dark

autocmd FileType c,cpp,cc,java call PROG()
autocmd FileType make setlocal noexpandtab

syntax enable
set background=dark

set spelllang=en,CJK " speel check


function PROG()
    set showmatch
    set nosmartindent
    set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
    set cinoptions=t0
    imap <C-a>f <END><CR>for(;;) {<CR>}<LEFT>
                \<CR><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
    imap <C-a>w <END><CR>while( ) {<CR>}<LEFT>
                \<CR><UP><UP><UP><END><LEFT><LEFT>
    set formatoptions=tcqr
endfunction

highlight Comment    ctermfg=DarkCyan
highlight SpecialKey ctermfg=Yellow

" setup for python 
"set pythonhome=C:\\python3
"set pythonthreedll=C:\\python3\\python38.dll
"set pythonthreedll=python38.dll

"alias
map <S-w> :w<CR>                    " using :update to replace :w
map <F3> :update<CR>:q<CR>
map <F4> :q!<CR>
"map <F8> :!gcc % -o %:r <CR>
"map <F9> :!make %:r <CR>
"map <F9> :!make <CR>

map <F10> <ESC>:read !date<CR>
"insert mode shortcut
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <DELETE>
inoremap jj <ESC>

"shortcut for tab
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>
nnoremap <C-l> $
nnoremap <C-h> ^

"shortcut for open new file
nnoremap te :tabedit 

" Python Optimization
"
" Enable folding
"set foldmethod=indent
"set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Let python file follow PEP8'
au BufNewFile, BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79
\ set expandtab
\ set autoindent
\ set fileformat=unix

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\ $/


"Plugin

filetype off "Vundle required
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'

" Python indent folder
"Plugin 'tmhedberg/SimpylFold'

" Python Indent
Plugin 'Vimjas/vim-python-pep8-indent'

" Python Auto Complete
Plugin 'davidhalter/jedi-vim'
let g:jedi#completions_command = "<C-N>"
let g:jedi#popup_on_dot = 0

"GOLang Support 
Plugin 'fatih/vim-go'

Plugin 'ervandew/supertab'

Plugin 'preservim/nerdcommenter' 



call vundle#end()            " required
filetype plugin indent on    " required
