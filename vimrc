set backspace=indent,eol,start
set expandtab
set hls
set ignorecase
set mouse+=a
set nocompatible
set ruler
set scrolloff=5
set shiftwidth=2
set showcmd
set smartcase
set tabstop=2
if &term =~ '^screen'
  set ttymouse=xterm2
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

map <Leader> <Plug>(easymotion-prefix)

map <Leader>cl :FormatCode<CR>

map <c-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '(%p%%) %l/%L  : %c'
let g:airline_theme = 'base16_colors'

colorscheme dark-ruby

filetype plugin indent on
syntax on
