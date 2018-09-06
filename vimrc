syntax on
set mouse=a
set noautoindent
set expandtab 
set tabstop=2 
set shiftwidth=2
let g:gitgutter_terminal_reports_focus=0
let NERDTreeShowHidden=1
let g:neodark#use_256color = 1 " default: 0
set updatetime=100
set ruler
set number

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'KeitaNakamura/neodark.vim'
Plug 'kamwitsta/mythos'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'

call plug#end()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePre *.rb %s/\s\+$//e

map <C-n> :NERDTreeToggle<CR>

