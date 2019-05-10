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
" set foldmethod=indent
" set foldnestmax=1
" nnoremap <space> za

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

" tags
set tags=./tags;/  " upwards search for tags file
" nmap <C-S-V> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap <C-S-X> <C-W><C-]>
nmap <C-t> :!tree -I *.pyc -I __pycache__<CR>

" taglist plugin
let Tlist_WinWidth = 50
nmap <F9> :TlistToggle<CR>
nmap <F12> :TlistOpen<CR>  " open taglist and jump to it

nmap Y y$
nmap D d$
nmap - }
nmap _ {
nnoremap n nzz
nnoremap N Nzz
nnoremap > >>
nnoremap < <<
nnoremap <leader>b q:
nnoremap <leader>: @:
nmap <C-j> <C-d>
nmap <C-k> <C-u>
" nmap <F10> :call CommentLine()<CR>
" nmap <C-F10> :call UnCommentLine()<CR>j0
nmap <F5> :set invnumber<CR>
nmap <F6> :call TogglePasteStyle()<CR>
nmap <F8> :set invlist<CR>
"nmap <leader>e :sp $MYVIMRC<CR><C-w>15+
nmap <leader>e :e!<CR>
"nmap <leader>t :call ToggleNumberStyle()<CR>
nmap <leader>n :nohl<CR>
nmap <leader>p Oimport pudb; pudb.set_trace()<Esc>j:w<CR>
nmap <leader>P :g/import pudb; pudb.set_trace\(\)/d<CR>:w<CR>:nohl<CR>
nmap <leader>t :.s/train/test/g<CR>:nohl<CR>
nmap <leader>T :.s/test/train/g<CR>:nohl<CR>
nmap <leader>1 :.s/2/1/g<CR>:nohl<CR>
nmap <leader>2 :.s/1/2/g<CR>:nohl<CR>

fun! CloseHiddenBuffers()
    let i = 0
    let n = bufnr('$')
    while i < n
        let i = i + 1
        if bufloaded(i) && bufwinnr(i) < 0
          exe 'bd ' . i
        endif
    endwhile
endf

command! Chd :call CloseHiddenBuffers()

fun! TogglePasteStyle()
	if &paste == 0
		let &paste = 1
	else
		let &paste = 0
	endif
endf

fun! ToggleNumberStyle()
	if &number == 1
		let &relativenumber = 1
		let &number = 0
	else
		let &relativenumber = 0
		let &number = 1
	endif
endf

nmap <leader>q :call ToggleSyntax()<CR>

fun! ToggleSyntax()
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

" un/comment line
nmap <leader>c I# <esc>j^
nmap <leader>m ^xx<esc>j^

" define R to so an output in a new window
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" always strip trailing white spaces with our common file types
autocmd BufWritePre *.{py,sh,js,html,sql,php,scala,cgi} :%s/\s\+$//e

" toggle and highlighting of the colorcolumn
if exists("+colorcolumn")
	nore <expr> <F7> ':set colorcolumn='.(&colorcolumn == "80" ? '""' : "80").'<CR>'
	hi ColorColumn ctermbg=yellow
endif

" automaticly reload .vimrc
" au! BufWritePost .vimrc source ~/.vimrc 

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

set runtimepath^=~/src/ctrlp.vim
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.git|misc|scripts|tmp)$',
	\ 'file': '\v\.(pyc|sqlite3|sqlitedb|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

" settings for command-T
let g:CommandTMaxHeight=20
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTRefreshMap='<C-r>'
let g:CommandTAcceptSelectionSplitMap='<C-f>'

" settings for snipmate
autocmd FileType python set ft=python.django
autocmd FileType htmldjango set ft=htmldjango.html
