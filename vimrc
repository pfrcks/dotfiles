
call plug#begin('~/.vim/bundle/')

Plug 'vim-scripts/indentpython.vim'                   
Plug 'davidhalter/jedi-vim'                           
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'                              
Plug 'nvie/vim-flake8'                                
Plug 'flazz/vim-colorschemes'                         
Plug 'ctrlpvim/ctrlp.vim'                         
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
if !has('nvim')
    Plug 'tpope/vim-sensible'                             
endif
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'                 
Plug 'honza/vim-snippets'                             
Plug 'scrooloose/nerdcommenter'                       
Plug 'tmhedberg/matchit'
Plug 'vim-scripts/vim-auto-save'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'reedes/vim-lexical'
Plug 'fisadev/vim-isort'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'Shougo/echodoc.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'justinmk/vim-sneak'
Plug 'zchee/deoplete-clang'
Plug 'simnalamburt/vim-mundo'
Plug 'deathlyfrantic/deoplete-spell'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'wincent/terminus'
Plug 'lervag/vimtex'
Plug 'zchee/deoplete-clang'
Plug 'simnalamburt/vim-mundo'
Plug 'deathlyfrantic/deoplete-spell'
call plug#end()

syntax on                                             " Enable syntax highlighting
let g:mapleader = ','

" Autocommands

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

if has('autocmd')
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


autocmd! bufwritepost .vimrc source %                                  " Automatic reloading of .vimrc

" Mappings

nnoremap <C-J> <C-W><C-J>                                              " Split Navigation
nnoremap <C-K> <C-W><C-K>                                              " Ctrl + h/j/k/l allows to move between splits
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za                                                    " Folding with spacebar
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
map <Leader>m <esc>:NERDTreeFind<CR>
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
map <C-c> :NERDTreeToggle<CR>                                          " Toggle NerdTree
map <Leader>bb Oimport ipdb; ipdb.set_trace() # BREAKPOINT<esc>         " Debugging python
noremap Y y$                                                           " Yank till end of line




function! SCLToggle()
    set nonumber!
    set relativenumber!
endfunction
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   l:all_non_errors,
    \   l:all_errors
    \)
endfunction
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd wrap
  set complete+=s
  map <Leader>n "ap
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colors gruvbox
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>


" Set commands

"set nocompatible              " required
"set cmdheight=2
set virtualedit=onemore
set statusline=%{LinterStatus()}
set statusline+=\ %t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set statusline+=\ %{strftime(\"%H:%M\")}
"set statusline+=%{gutentags#statusline()}
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set t_Co=256
set background=dark
set number
set relativenumber
set backspace=indent,eol,start
set pastetoggle=<F2>
set clipboard=unnamed
set guioptions+=a
set nowrap  " don't automatically wrap on load
set formatoptions-=t   " don't automatically wrap text when typing
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
set mouse=a


" Colors

colorscheme gruvbox
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg
highlight ColorColumn ctermbg=233


" Initializations and Plugin Specific Commands
let g:python_highlight_all=1
let g:NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"autocmd VimEnter * NERDTree
let g:ctrlp_max_height = 30
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:flake8_quickfix_height=15
let g:rehash256 = 1
let g:solarized_termcolors=256
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:auto_save_in_insert_mode = 0
let g:auto_save=1
let g:auto_save_no_updatetime = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:hardtime_showmsg = 1
let g:hardtime_default_on = 1
let g:rustfmt_autosave = 1
let g:python_highlight_all = 1
let g:ale_linters = {
            \   'markdown': ['proselint', 'vale'],
            \   'python': ['flake8'],
            \   'text': ['proselint', 'vale'],
            \   'vim': ['vint'],
            \   'latex': ['lacheck'],
            \   }
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8'], 'typescript' : ['tslint']}
let g:ale_fix_on_save = 1
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, {'z':'~/.zshrc' }, {'t':'~/.tmux.conf'}]

let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

set undofile
set undodir=~/.vim/undodir
"let g:completor_python_binary = '/Users/amagrawal/code/homebrew/bin/python'

if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        let g:python3_host_prog = '/Users/amol/anaconda3/bin/python'
        "let g:python_host_prog = '/Users/amol/anaconda2/bin/python'
    else
        "let g:python_host_prog = '/home/amol/anaconda2/bin/python'
        let g:python3_host_prog = '/home/amol/anaconda3/bin/python'
    endif
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p
tnoremap <Esc> <C-\><C-n>
let g:deoplete#enable_at_startup = 1
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
let g:highlightedyank_highlight_duration = 200
let g:sneak#label = 1
"map <Leader> <Plug>(easymotion-prefix)
let g:multi_cursor_select_all_word_key = '<C-g>'
noremap <Leader>f :Files<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>t :Tags<CR>
let g:gutentags_cache_dir = '~/.vim/gutentags/'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
let g:deoplete#sources#clang#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/6.0.0/'
let g:ale_cpp_clangtidy_options = '-Wall -std=c++11 -x c++'
let g:ale_cpp_clangcheck_options = '-- -Wall -std=c++11 -x c++'
let g:vimwiki_list = [{ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext=0
let g:goyo_width=100
let g:vim_markdown_math = 1
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/6.0.1/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/6.0.1/lib/clang'
