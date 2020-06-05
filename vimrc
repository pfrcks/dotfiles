call plug#begin('~/.vim/bundle/')

Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tmhedberg/matchit'
Plug 'vim-scripts/vim-auto-save'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-multiple-cursors'
Plug 'reedes/vim-lexical'
Plug 'fisadev/vim-isort'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'

call plug#end()

syntax on
let g:mapleader = ','



" Autocommands


" Select filetypes for vim-lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" Cursor jump to last position
if has('autocmd')
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Highlight extra whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Quit if there is no active buffers
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Don't select NerdTree by default
autocmd VimEnter * wincmd p

" Source vimrc on write
autocmd! bufwritepost .vimrc source %



" Mappings


" Switch between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
map <Leader>m <esc>:NERDTreeFind<CR>
vnoremap <Leader>s :sort<CR>
vnoremap < <gv
vnoremap > >gv
vmap Q gq
nmap Q gqap
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <F6> :w<CR> :! ./%<CR>
command! Q  quit
command! W  write
command! Wq wq
" M replaces the last searched string with input
nmap <expr>  M  ':%s/' . @/ . '//g<LEFT><LEFT>'
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
" Open again in sudo
cmap w!! w !sudo tee >/dev/null %
map <C-c> :NERDTreeToggle<CR>
noremap Y y$



" Set commands

set virtualedit=onemore
set splitbelow
set splitright
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
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
set undofile
set undodir=~/.vim/undodir
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c


" Colors

silent! colorscheme gruvbox

" Initializations and Plugin Specific Commands
let g:auto_save_in_insert_mode = 0
let g:auto_save=1
let g:auto_save_no_updatetime = 1
let g:startify_bookmarks = [ {'c': '~/.vimrc'}, {'z':'~/.zshrc' }, {'t':'~/.tmux.conf'}]



tnoremap <Esc> <C-\><C-n>
let g:multi_cursor_select_all_word_key = '<C-g>'
let g:goyo_width=100
let g:vim_markdown_math = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

noremap <Leader>ff :Files<CR>
noremap <Leader>fb :Buffers<CR>
noremap <Leader>ft :Tags<CR>
noremap <Leader>fp :Rg<SPACE><CR>
noremap <Leader>fg :GFiles<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
