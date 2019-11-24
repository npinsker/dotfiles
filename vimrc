set autochdir
set autoindent
set backspace=indent,eol,start
set encoding=utf8
set hls
set ignorecase
set mouse+=a
set nocompatible
set noswapfile
set ruler
set scrolloff=5
set shell=bash
set shiftwidth=4
set showcmd
set smartcase
set t_Co=256
set expandtab
set tabstop=4
set softtabstop=4
if &term =~ '^screen'
  set ttymouse=xterm2
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let mapleader=","

nmap t% :tabedit %<CR>
nmap td :tabclose <CR>

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'

" Syntax
"Plugin 'davidhalter/jedi-vim'
Plugin 'jdonaldson/vaxe'
Plugin 'mxw/vim-jsx'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-python/python-syntax'

" Color & appearance plugins
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'sentientmachine/Pretty-Vim-Python'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

map <Leader> <Plug>(easymotion-prefix)

map <Leader>cl :FormatCode<CR>

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

map <c-n> :NERDTreeFind<CR>
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen = 1

" Close NERDTree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

set background=dark

"let branch = system("type 'docker'")
colorscheme molokai

"let g:ycm_server_python_interpreter='/usr/bin/python3'
"let g:ycm_global_ycm_extra_conf='/home/npinsker/.vim/bundle/bazel-compilation-database/.ycm_extra_conf.py'

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>f :FZF<cr>
nnoremap <c-p> :FZF<cr>

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '(%p%%) %l/%L  : %c'
let g:airline_theme = 'base16_colors'

let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['py'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['Dockerfile'] = ''

nnoremap K :Ggr <cword><CR>
nnoremap L :Ggr ""<left>
nnoremap ; :
nnoremap : ;

highlight Comment cterm=bold

let g:python_highlight_all=1
"let g:jedi#popup_on_dot = 0

syntax on

hi Directory guifg=#96CBFE guibg=#00ff00

hi PmenuSel ctermbg=Red ctermfg=white

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


"augroup insertMatch
"    au!
"    au BufReadPost * NoMatchParen
"    "au InsertEnter * DoMatchParen
"    "au InsertLeave * NoMatchParen
"augroup END
"filetype plugin indent on
set softtabstop=2
set tabstop=2
set expandtab
