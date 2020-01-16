set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim'

call vundle#end()            " required
filetype plugin indent on    " required

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

set ruler

set relativenumber 
set number

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

set backspace=eol,start

map 0 ^

set showmatch

syntax on
color dracula

" By default don't wrap lines
set nowrap 

" But do wrap on these types of files...
autocmd FileType markdown setlocal wrap
autocmd Filetype gitcommit setlocal spell textwidth=72

" j and k don't skip over wrapped lines in following FileTypes, unless given a
" count (helpful since I display relative line numbers in these file types)
autocmd FileType markdown,text vnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType markdown,text vnoremap <expr> k v:count ? 'k' : 'gk'

nnoremap <Leader>rc :vsplit $MYVIMRC<cr>;
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

