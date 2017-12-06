execute pathogen#infect()
syntax on
syntax enable
colorscheme peachpuff
filetype plugin indent on
source ~/.vim/statusline.vim

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_javascript_checkers=['eslint']
let g:jsx_ext_required = 0

imap jj <esc>
set cursorline
set noshowmode
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set smarttab
set wrap
set autoindent
set smartindent
set nofoldenable "don't fold code sections
set smartcase
set ignorecase "ignore case when searching
set hlsearch "highlight searched term
set incsearch "highlight while typing
set ruler "show position
set number "show line numbers
set scrolloff=5 "scroll when 5 lines are left

"turn backup off
set nobackup
set nowb
set noswapfile

"no sound on errors
set noerrorbells
"set novisualbell

"move over wrapped lines
nnoremap j gj
nnoremap k gk

let mapleader=","
let g:mapleader=","

nmap <leader>e :NERDTreeToggle<cr>
nmap <leader>/ :noh<cr>
let g:NERDTreeShowHidden=1

map <leader>v <C-W>v
map <leader>h <C-W>n
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

nnoremap <leader>b :bp<cr>
nnoremap <leader>g :e#<cr>

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|build'

" Remove trailing whitespace while keeping cursor position
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
" Only for a few file types
"autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" Of for every file type
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
