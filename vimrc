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

let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim

" Use the 'google' package by default (see http://go/vim/packages).
source /usr/share/vim/google/google.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'

call vundle#end()
filetype plugin indent on

map <Leader> <Plug>(easymotion-prefix)

map <Leader>cl :FormatCode<CR>

"Glug codefmt plugin[mappings] gofmt_executable="goimports"
Glug codefmt
Glug codefmt-google

" Load YCM (http://go/ycm) for semantic auto-completion and quick syntax
" error checking. Pulls in a google3-enabled version of YCM itself and
" a google3-specific default configuration.
Glug youcompleteme-google

" Load the automated blaze dependency integration for Go.
" Note: for Go, blazedeps uses the Go team's glaze tool, which is fully
" supported by the Go team; for other languages. Note that the plugin is
" currently unsupported for other languages.
"Glug blazedeps auto_filetypes=`['go']`

" Load piper integration (http://wiki/Main/VimPerforce).
"Glug piper plugin[mappings]

" Load the Critique integration. Use :h critique for more details.
"Glug critique plugin[mappings]

" Load blaze integration (http://go/blazevim).
"Glug blaze plugin[mappings]

" Load the syntastic plugin (http://go/vim/plugins/syntastic-google).
" Note: this requires installing the upstream syntastic plugin from
" https://github.com/scrooloose/syntastic.
"Glug syntastic-google

" Load the ultisnips plugin (http://go/ultisnips).
" Note: this requires installing the upstream ultisnips plugin from
" https://github.com/SirVer/ultisnips.
"Glug ultisnips-google

" All of your plugins must be added before the following line.
" See go/vim-plugin-manager if you need help picking a plugin manager and
" setting it up.

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on
syntax on
