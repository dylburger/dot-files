" Dylan J. Sather's .vimrc file
" Created: 2010-08-24
" Last Edited: 2010-08-24

" Remove splash screen 
:set shortmess+=I

:syntax on
:set ruler
:set nomodeline
:set t_Co=256 
:set ignorecase  " Case-insensitive search
:set mouse=a  " Use the mouse in all modes
:set backspace=2  " Backspace through auto-indentation, etc.
:set autoindent  " Allows for auto-indentation; great for programming
:colorscheme fruit

" Line nums
:set number

" Fixing tabs
:set softtabstop=2
:set shiftwidth=2
:set noexpandtab

" Incremental, smart case-insenstive and highlight search
:set incsearch ignorecase smartcase hlsearch
" Clear highlight search by pressing Esc
nnoremap <esc> :noh<return><esc>

" Force yourself to work in normal mode... disable arrow keys
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" Move between split windows using Ctrl-J and Ctrl-K
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" Load pathogen stuff
call pathogen#infect()

" python stuff
:autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
:autocmd FileType python set tabstop=4
:autocmd FileType python set shiftwidth=4
:autocmd FileType python set softtabstop=4

" ruby stuff
:autocmd FileType ruby set nocompatible
:autocmd FileType ruby set tabstop=2
:autocmd FileType ruby set shiftwidth=2
:autocmd FileType ruby set softtabstop=2
:autocmd FileType ruby set ai
:autocmd FileType ruby set expandtab
:autocmd FileType ruby set smarttab
:autocmd FileType ruby set cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module,ensure
:autocmd FileType ruby set smartindent cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module,ensure
:autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
:autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
:autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
:autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" puppet stuff
au BufRead,BufNewFile *.pp   setfiletype puppet

" nagios stuff
au BufRead,BufNewFile *.cfg   setfiletype nagios

" For People who catn't tpye
:command WQ wq
:command Wq wq

" Git commands
:command Gd GitDiff
:command Gs GitStatus
:command Ga GitAdd
:command Gc GitCommit
:command Gp GitPush
:command Up GitPull
