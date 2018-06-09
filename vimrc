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

Plugin 'brookhong/ag.vim'
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
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|)|\.pyc$'

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '(%p%%) %l/%L  : %c'
let g:airline_theme = 'base16_colors'

map <c-k> :Ag! "\b<C-R><C-W>\b"<CR>

colorscheme dark-ruby

filetype plugin indent on
syntax on
