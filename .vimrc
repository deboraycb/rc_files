" Vundle - plugin manager for vim
" (next lines are for Vundle)
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'vim-scripts/vim-R-plugin'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" R plugin settings
let maplocalleader = ","
"vmap <Space> <Plug>RDSendSelection " when in normal mode, send selection to R with space bar
"nmap <Space> <Plug>RDSendLine " when in normal mode, send line to R with space bar
let vimrplugin_applescript=0
let vimrplugin_vsplit=1 " split window vertically when opening R
let vimrplugin_assign_map = "--"

" basic vim settings
set rnu
set nu

" size of a hard tabstop
" a combination of spaces and tabs are used to simulate tab stops at a width
"other than the (hard)tabstop
" always uses spaces instead of tab characters
" size of an "indent"
" make "tab" insert indents instead of tabs at the beginning of a line
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" recognize .md files as markdown (for syntax highlighting)
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" highlight current line
set cursorline
" use bold, etc other than underline to highlight current line
hi CursorLine term=bold cterm=bold guibg=Grey40
