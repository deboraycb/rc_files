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
" [example] Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'Shougo/neocomplete.vim'                                                                                                                            
Plugin 'scrooloose/nerdcommenter'
Plugin 'jpalardy/vim-slime'
Plugin 'hanschen/vim-ipython-cell'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" [example] Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" [example] Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" [example] Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
" R script settings
let maplocalleader = ","
"vmap <Space> <Plug>RDSendSelection
"nmap <Space> <Plug>RDSendLine
let vimrplugin_applescript=0
let vimrplugin_vsplit=1
let vimrplugin_assign_map = "--" 

"------------------------------------------------------------------------------
" slime configuration
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'
let g:slime_paste_file = expand("$HOME/.slime_paste")

" fix paste issues in ipython
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": get(split($TMUX,","),0), "target_pane": ":.1"}

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
"see vim-ipython-cell faq
let g:ipython_cell_prefer_external_copy = 1
" Keyboard mappings. <Leader> is \ (backslash) by default
" <localleader> is ,

" map <localleader>s to start IPython
nnoremap <localleader>rf :SlimeSend1 ipython --matplotlib<CR>
" map <localleader>r to run script
nnoremap <localleader>aa :IPythonCellRun<CR>
" map <localleader>R to run script and time the execution
nnoremap <localleader>at :IPythonCellRunTime<CR>
" map <localleader>c to execute the current cell
nnoremap <localleader>cc :IPythonCellExecuteCell<CR>
" map <localleader>C to execute the current cell and jump to the next cell
nnoremap <localleader>ca :IPythonCellExecuteCellJump<CR>
" map <localleader>l to clear IPython screen
nnoremap <localleader>rr :IPythonCellClear<CR>
" map <localleader>x to close all Matplotlib figure windows
nnoremap <localleader>x :IPythonCellClose<CR>
" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>
" map <localleader>h to send the current line or current selection to IPython
nmap <localleader>l <Plug>SlimeLineSend
nmap <Space> <Plug>SlimeLineSend
xmap <localleader>pp <Plug>SlimeRegionSend
xmap <Space> <Plug>SlimeRegionSend
" map <localleader>p to run the previous command
nnoremap <localleader>pr :IPythonCellPrevCommand<CR>
" map <localleader>Q to restart ipython
nnoremap <localleader>R :IPythonCellRestart<CR>
" map <localleader>d to start debug mode
nnoremap <localleader>D :SlimeSend1 %debug<CR>
" map <localleader>q to exit debug mode or IPython
nnoremap <localleader>Q :SlimeSend1 exit<CR>

"------------------------------------------------------------------------------
" basic vim settings
"------------------------------------------------------------------------------
set rnu
set nu
syntax on

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
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=black
