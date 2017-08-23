set nocompatible
filetype off

execute pathogen#infect()

syntax on                       " enable syntax processing
filetype plugin indent on       " load filetype-specific indent files


" COLOR SCHEME
set background=dark
set termguicolors
let g:gruvbox_italic=1          " required by gruvbox for terminals
colorscheme gruvbox
"colorscheme base16-default-dark


" SPACES/TABS
set tabstop=2           " width of a TAB
set shiftwidth=2        " number of spaces to use for each indent '>'
set expandtab           " use spaces instead of TABs
"set softtabstop=4       " number of columns in TAB


" FORGET ARROW KEYS
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>


" UI
set number              " show current line number
set relativenumber      " show relative line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set nowrap              " do not wrap lines
set colorcolumn=80      " line-width marker


" SEARCH
set wildmenu            " visual autocomplete for command menu
set ignorecase          " ignore case in search patterns
set smartcase           " unless uppercase char is typed
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search pattern highlighting
nnoremap <Leader><space> :nohlsearch<CR>


" PLUGINS & KEYMAPPING

" -----------AIRLINE-------------
set laststatus=2        " enable airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_default'
" -----------AIRLINE-------------

" -----------CtrlP---------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_lazy_update = 500
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
\ }
" -----------CtrlP---------------

" -----------SYNTASTIC-----------
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['go']
" -----------SYNTASTIC-----------

"map <Leader>n :NERDTreeToggle<CR>
