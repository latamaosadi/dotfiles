syntax on

set guicursor=
set relativenumber
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set backspace=indent,eol,start
set hlsearch
set signcolumn=yes

" Give more space for displaying messages.
set cmdheight=1

set laststatus=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
" let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=0 guibg=lightgrey
" highlight Visual term=reverse cterm=reverse guibg=Grey
highlight Comment cterm=italic gui=italic

set guifont=Fira\ Code:h16

call plug#begin('~/.vim/plugged')

Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jwalton512/vim-blade'
Plug 'airblade/vim-gitgutter'

" Color Schemes Plugins
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'wadackel/vim-dogrun'
Plug 'artanikin/vim-synthwave84'

call plug#end()

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ }

colorscheme gruvbox

let g:gruvbox_hls_cursor = 'orange'
let g:gruvbox_invert_selection=0

" hi CursorLine term=bold cterm=bold guibg=NONE
" hi Visual guifg=#f51a9e guibg=#ffffff term=reverse cterm=reverse gui=none

let g:gitgutter_async=1

let loaded_matchparen = 1
let mapleader = " "

let NERDTreeShowHidden=1

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

set timeoutlen=1000 ttimeoutlen=0
nnoremap <leader>p :Files<CR>
nnoremap <leader><CR> :nohlsearch<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <silent> <leader>z :Goyo<cr>

map <C-o> :NERDTreeToggle<CR>

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" Trim whitespace function
" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
command! TrimWhitespace call TrimWhitespace()

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
