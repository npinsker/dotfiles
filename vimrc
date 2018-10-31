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
set shiftwidth=2
set showcmd
set smartcase
set t_Co=256
set expandtab
set tabstop=2
set softtabstop=2
if &term =~ '^screen'
  set ttymouse=xterm2
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let mapleader=","

nmap t% :tabedit %<CR>
nmap td :tabclose <CR>

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'

" Syntax
Plugin 'davidhalter/jedi-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Color & appearance plugins
Plugin 'ervandew/supertab'
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

colorscheme npinsker

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --vimgrep'

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_clear_cache_on_exit = 0
endif
let g:ctrlp_max_files=400000
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$',
    \ }

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

highlight Comment cterm=bold

let g:python_highlight_all=1
let g:jedi#popup_on_dot = 0

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
