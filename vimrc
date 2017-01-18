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
" zM      - Close all folds
" zR      - Open all folds

" Jedi Vim Shortcuts
" ~~~~~~~~~~~~~~~~~~
" <leader>g             - Goto assignments
" <leader>d             - Goto Definition
" K                     - Show Documentation
" <leader>n             - Show all usages
" :Pyimport module name - Opens the module

call plug#begin('~/.vim/bundle/')

Plug 'tmhedberg/SimpylFold'                           " Enables better folding for Python
Plug 'vim-scripts/indentpython.vim'                   " Better Indentation
Plug 'davidhalter/jedi-vim', { 'on': [] }             " Auto-completion and other IDE features
Plug 'scrooloose/syntastic'                           " Syntax checkers
Plug 'majutsushi/tagbar'                              " Gives an overview of file structure in a side pane
Plug 'nvie/vim-flake8'                                " Syntax checker for syntastic
Plug 'jnurmine/Zenburn'                               " Colorscheme
Plug 'altercation/vim-colors-solarized'               " Colorscheme
Plug 'flazz/vim-colorschemes'                         " Pack of Colorschemes
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'} " Fast and efficient File Browser
Plug 'jistr/vim-nerdtree-tabs'                        " Makes NerdTree behave like a file manager
Plug 'kien/ctrlp.vim'                                 " Fuzzy File Finder
Plug 'vim-airline/vim-airline'                        " Lightweight Status Bar
Plug 'mhinz/vim-startify'                             " Provides a splash screen for vim
Plug 'tpope/vim-sensible'                             " Sensible defaults for vim
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips', { 'on': [] }                 " Snippets expansion for vim
Plug 'honza/vim-snippets'                             " Support for Ultisnips
Plug 'godlygeek/tabular'                              " For alignment of markes
Plug 'plasticboy/vim-markdown'                        " For highlighting and syntax of markdown
Plug 'scrooloose/nerdcommenter'                       " Easy commenting
Plug 'junegunn/vim-peekaboo'                          " Take a sneak peek at registers
Plug 'junegunn/limelight.vim'                         " Paired with goyo for super focusing
Plug 'junegunn/goyo.vim'                              " Distraction free mode for writing
Plug 'tmhedberg/matchit'
Plug 'voithos/vim-python-matchit'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
call plug#end()

syntax on                                             " Enable syntax highlighting
let mapleader = ","
call togglebg#map("<F5>")                             " Toggle between different colorschemes based on need.

" Autocommands

augroup load_us_jedivim                               " Lazy loading of Ultisnips and Jedi-Vim : Saves time
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'jedi-vim')
                     \| autocmd! load_us_jedivim
augroup END

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

au BufNewFile,BufRead *.py                                                                 " PEP8 Indentation
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red  " Show whitespace explicitly
au InsertLeave * match ExtraWhitespace /\s\+$/                         " MUST be inserted BEFORE the colorscheme command


autocmd! User GoyoEnter nested call <SID>goyo_enter()                  " Execute commands on :Goyo
autocmd! User GoyoLeave nested call <SID>goyo_leave()                  " Execute commands on :Goyo!
autocmd! bufwritepost .vimrc source %                                  " Automatic reloading of .vimrc

" Mappings

nnoremap <C-J> <C-W><C-J>                                              " Split Navigation
nnoremap <C-K> <C-W><C-K>                                              " Ctrl + h/j/k/l allows to move between splits
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za                                                    " Folding with spacebar
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <C-Z> :update<CR>                                              " Save with Ctrl+Z
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
noremap <Leader>e :quit<CR>                                            " Quit with , + e
map <Leader>n <esc>:tabprevious<CR>                                    " Easier moving between tabs
map <Leader>m <esc>:tabnext<CR>
vnoremap <Leader>s :sort<CR>                                           " Map sort function to a key
vnoremap < <gv                                                         " Better indentation
vnoremap > >gv                                                         " Better indentation
vmap Q gq                                                              " Easier formatting of paragraphs
nmap Q gqap
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>          " Execute python script from vim.
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> " Remove trailing spaces
nmap <F6> :w<CR> :! ./%<CR>                                            " Save and run the current script
command! Q  quit
command! W  write
command! Wq wq
map <left> <nop>
map <down> <nop>
map <up> <nop>
map <right> <nop>
imap <left> <nop>
imap <down> <nop>
imap <up> <nop>
imap <right> <nop>
nmap <expr>  M  ':%s/' . @/ . '//g<LEFT><LEFT>'                        " M replaces the last searched string with input
nmap <Leader><space> :TagbarToggle<CR>                                 " ,space toggles TagBar
nnoremap <F8> :call SCLToggle()<cr>
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[                                               " Esc Esc disables search highlighting
cmap w!! w !sudo tee >/dev/null %                                      " Open again in sudo
map <C-n> :NERDTreeToggle<CR>                                          " Toggle NerdTree
map <Leader>bb Oimport ipdb; ipdb.set_trace() # BREAKPOINT<esc>         " Debugging python
noremap Y y$                                                           " Yank till end of line

" Helper Functions

function! SCLToggle()
    set nonumber!
    set relativenumber!
    if g:syntastic_enable_signs == 1
        let g:syntastic_enable_signs=0
    else
        let g:syntastic_enable_signs=1
    endif
    echo g:syntastic_enable_signs
endfunction

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

" Set commands

set nocompatible              " required
set virtualedit=onemore
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set t_Co=256
set background=dark
set nu
set relativenumber
set backspace=indent,eol,start
set pastetoggle=<F2>
set clipboard=unnamedplus
set go+=a
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=120
set history=700
set undolevels=700
set lazyredraw
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set nowritebackup
set noswapfile
set laststatus=2
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set tabstop=4
set shiftwidth=4
set expandtab
set ttyfast


" Colors

" Colors based on mode
" if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme desert
"endif

colorscheme molokai
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
highlight ColorColumn ctermbg=233


" Initializations and Plugin Specific Commands
let g:SimpylFold_docstring_preview=1
let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:ctrlp_max_height = 30
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:Powerline_symbols = 'fancy'
let g:UltiSnipsExpandTrigger="`"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"
let g:UltiSnipsEditSplit="vertical"
let g:flake8_quickfix_height=15
let g:jedi#show_call_signatures = "0"
let g:peekaboo_prefix = '<leader>'
let g:rehash256 = 1
let g:airline_powerline_fonts = 1
let g:jedi#use_tabs_not_buffers = 1
let g:solarized_termcolors=256
let g:jedi#auto_close_doc=1
let g:SuperTabDefaultCompletionType = "<c-n>"
