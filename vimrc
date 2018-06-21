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

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'

" Color plugins
Plugin 'sentientmachine/Pretty-Vim-Python'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

map <Leader> <Plug>(easymotion-prefix)

map <Leader>cl :FormatCode<CR>

" Highlight currently open buffer in NERDTree
autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif


map <c-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --vimgrep'

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_clear_cache_on_exit = 0
endif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|)|\.pyc$'

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '(%p%%) %l/%L  : %c'
let g:airline_theme = 'base16_colors'

nnoremap K :Ack!<Space>

colorscheme molokai
highlight Comment cterm=bold

filetype plugin indent on
syntax on
