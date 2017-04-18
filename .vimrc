set nocompatible

syntax on
filetype plugin indent on

" simply the best
colorscheme peachpuff

" our choosen leader
:let mapleader = ","

" general
set ruler
set history=50
set autoread
set splitbelow
set splitright
set hidden
set encoding=utf8
set number
set backspace=indent,eol,start
" set nofoldenable
set foldmethod=syntax
set foldnestmax=1

" store the swap and undo files in extra folders, with the full path
" to avoid problems with identical names
set directory=~/.vim/swap/,/var/tmp/,.

" set undo files when possible
if exists("+undodir")
	set undofile
	set undodir=~/.vim/undo/,/var/tmp/,.
endif

" bell stuff
set noerrorbells
set visualbell t_vb=

" search
set hlsearch
set smartcase
set incsearch
set ignorecase

" how we like to write
set tabstop=4
set autoindent
set scrolloff=5
set shiftwidth=4

" born to be wild
set wildmenu

" command line
set showcmd
set laststatus=2
set confirm
set cmdheight=2

autocmd FileType sql setl list
autocmd FileType python setl expandtab smarttab

" session save options
set ssop-=options
set ssop-=folds
nmap <leader>s :mksession! ~/.vim/.session.vim<CR>
nmap <leader>r :source ~/.vim/.session.vim<CR>

nmap Y y$
nmap D d$
nnoremap n nzz
nnoremap N Nzz
nnoremap > >>
nnoremap < <<
nnoremap <leader>b q:
nnoremap <leader>: @:
nmap <space> /
nmap <C-j> <C-d>
nmap <C-k> <C-u>
nmap <F10> :call CommentLine()<CR>
nmap <C-F10> :call UnCommentLine()<CR>j0
nmap <F5> :set invnumber<CR>
nmap <F6> :call TogglePasteStyle()<CR>
nmap <F8> :set invlist<CR>
nmap <F9> :noh<CR>:echo ""<CR>
nmap <leader>e :sp $MYVIMRC<CR><C-w>15+
nmap <leader>n :call ToggleNumberStyle()<CR>
nmap <leader>p oimport pudb; pudb.set_trace()<Esc>j

fun TogglePasteStyle()
	if &paste == 0
		let &paste = 1
	else
		let &paste = 0
	endif
endf

fun ToggleNumberStyle()
	if &number == 1
		let &relativenumber = 1
		let &number = 0
	else
		let &relativenumber = 0
		let &number = 1
	endif
endf

nmap <leader>q :call ToggleSyntax()<CR>

fun ToggleSyntax()
	if exists('g:syntax_on')
		syntax off
	else
		syntax on
	endif
endf

" window navigation
nmap <leader>h <C-w><left>
nmap <leader>j <C-w><down>
nmap <leader>k <C-w><up>
nmap <leader>l <C-w><right>

" window resizing
nmap <leader>+ <C-w>15+
nmap <leader>- <C-w>15-
nmap <leader>< <C-w>20<
nmap <leader>> <C-w>20>
nmap <leader>_ <C-w>_

" window changin + resizing
nmap <leader>f <Esc><C-w><down><C-w>_
nmap <leader>d <Esc><C-w><up><C-w>_
nmap <leader>J <C-w>J
nmap <leader>K <C-w>K
nmap <leader>H <C-w>H
nmap <leader>L <C-w>L

" change working dir to the one of the current file
nmap <leader>c :cd %:p:h<CR>

" always strip trailing white spaces with our common file types
autocmd BufWritePre *.{py,sh,js,html,sql,php,scala,cgi} :%s/\s\+$//e

" toggle and highlighting of the colorcolumn
if exists("+colorcolumn")
	nore <expr> <F7> ':set colorcolumn='.(&colorcolumn == "80" ? '""' : "80").'<CR>'
	hi ColorColumn ctermbg=yellow
endif

" automaticly reload .vimrc
au! BufWritePost .vimrc source ~/.vimrc 

" set json filetype to javascript
au BufRead,BufNewFile *.json set filetype=javascript

" Add the current file's directory to the path if not already present.
au BufRead *
	\ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
	\ exec "set path+=".s:tempPath

" the set list magic
set listchars=eol:$,tab:\|-,trail:~,extends:>,precedes:<

" setting the status line format
set statusline=%<%f\ [%Y%R%M]%h%w\ %n%=%l,%v\ \ %p%%\

" settings for command-T
let g:CommandTMaxHeight=20
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTRefreshMap='<C-r>'
let g:CommandTAcceptSelectionSplitMap='<C-f>'

" settings for snipmate
autocmd FileType python set ft=python.django
autocmd FileType htmldjango set ft=htmldjango.html
