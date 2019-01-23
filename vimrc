syntax on
set mouse=a
let g:gitgutter_terminal_reports_focus=0
let NERDTreeShowHidden=0
let g:neodark#use_256color = 1 " default: 0
set updatetime=100
set ruler
set number
set clipboard=unnamed
set encoding=utf-8

au BufNewFile,BufRead *.py
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
  \ set expandtab
  \ set noautoindent
  \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, *.rb
  \ set tabstop=2
  \ set softtabstop=2
  \ set shiftwidth=2
  \ set noautoindent

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h m,atch BadWhitespace /\s\+$/

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
Plug 'rakr/vim-one'
"Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

let python_highlight_all=1
syntax on

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:one_allow_italics = 1
set background=dark
colorscheme neodark

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePre *.rb %s/\s\+$//e

map <C-n> :NERDTreeToggle<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_Base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
