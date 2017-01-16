" NOTE !~~*********~~!
" Please find below a short readme of the functionality enabled by this vimrc
" file.
"
" Function Keys
" ~~~~~~~~~~~~~
" <F2> - Toggles Paste Style       : Useful when you want to paste text into vim.
" <F4> - Removes trailing spaces   : Remove the black and pink colorations.
" <F5> - Toggle colors in terminal : For different occasions.
" <F6> - Run Script                : Saves and runs the script.
" <F8> - Toggles Line Numbers      : For easier copying by mouse in vim.
"
" Plugin Shortcuts
" ~~~~~~~~~~~~~~~~
" ,cc     - Comments all the lines selected in visual mode
" ,cSpace - Toggles the comment state of lines selected in visual mode.
" Ctrl+l  - Move to the right split
" Ctrl+h  - Move to the left split
" Ctrl+z  - Saves and updates the file.
" Ctrl+q  - Quit the file.
" Ctrl+n  - Open file explorer in vim.
" Ctrl+p  - Open file searcher in vim.


set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-sensible'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" File Splitting
set splitbelow
set splitright

" Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding
set foldmethod=indent
set foldlevel=99
" Folding with spacebar
nnoremap <space> za

" Allow docstring on fold
let g:SimpylFold_docstring_preview=1

" PEP8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Set Encoding
set encoding=utf-8

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python Highlighting
let python_highlight_all=1
syntax on

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Colors based on mode
" if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme desert
"endif

let g:rehash256 = 1
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme molokai


call togglebg#map("<F5>")

" Ignore pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu
set backspace=indent,eol,start


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamedplus
set go+=a

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Set mouse
" set mouse=a

" Save with Ctrl+Z
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quit with Ctrl+Q
noremap <Leader>e :quit<CR> 

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Showing line numbers and length
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=120
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700
set lazyredraw
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Plugins Stuff

" Powerline
set laststatus=2

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

let g:ycm_python_binary_path='/home/watson/anaconda2/bin/python2.7'
map <C-n> :NERDTreeToggle<CR>

set tabstop=4
set shiftwidth=4
set expandtab
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" Remove trailing spaces
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Save and run the current script
nmap <F6> :w<CR> :! ./%<CR>

command! Q  quit
command! W  write
command! Wq wq

" Syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }
" set virtualedit=all
set ttyfast

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:Powerline_symbols = 'fancy'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"
let g:UltiSnipsExpandTrigger="`"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

let g:flake8_quickfix_height=15

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

nnoremap <F8> :call SCLToggle()<cr>
function! SCLToggle()
    set nonumber!
    if g:syntastic_enable_signs == 1
        let g:syntastic_enable_signs=0
    else
        let g:syntastic_enable_signs=1
    endif
    echo g:syntastic_enable_signs
endfunction
let g:jedi#show_call_signatures = "0"

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

cmap w!! w !sudo tee >/dev/null %
