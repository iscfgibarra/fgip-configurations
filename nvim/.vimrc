"Generales
syntax on
filetype plugin indent on
set autoread wildmode=longest,list,full
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=2 autoindent smartindent tabstop=2 softtabstop=2 expandtab  
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set hls is ic
set laststatus=2 
set cmdheight=1
au BufRead,BufNewFile *.fountain set filetype=fountain
set splitbelow splitright 
set nobackup nowritebackup
set colorcolumn=80
set noswapfile
set t_Co=256
 
"Linea de estatus
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=\%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

"Configuracion inicial basica
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set relativenumber
set laststatus=2

" Instalar python
"let g:python3_host_prog = 'C:/Users/Francisco Ibarra/AppData/Local/Programs/Python/Python38-32/'

"Instalacion de Plugins
"<ESC> Luego teclear :Plug <TAB> y con el tabulador elegir PlugInstall y dar <ENTER>
call plug#begin(stdpath('data') . '/plugged')
  "Herramientas
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'easymotion/vim-easymotion'
  Plug 'scrooloose/nerdtree'
  Plug 'christoomey/vim-tmux-navigator'

  "Sintaxis
  Plug 'tpope/vim-markdown'
  Plug 'ap/vim-css-color'
  Plug 'vim-scripts/fountain.vim'
  Plug 'pangloss/vim-javascript' "Javascript Support	
  Plug 'leafgarland/typescript-vim' "Typescript support

  "Temas
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'NLKNguyen/papercolor-theme'     
  Plug 'ajh17/Spacegray.vim'     
  Plug 'chriskempson/base16-vim'

  "Busqueda de archivos
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  
  "Adicionales
  Plug 'ervandew/supertab'
  Plug 'Yggdroot/indentLine'
call plug#end()


"Tema default -----------------------

if (has("termguicolors"))   
  set termguicolors 
endif 


"Color Settings
colorscheme dracula
set background=dark cursorline

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

""Goyo settings
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set nocursorline
  CocDisable
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set cursorline
  CocEnable
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"Mapeos---------------------------
let mapleader=" "

"Guardar y salir
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nnoremap <C-s> :w<CR>

"Busqueda en codigo
nmap <Leader>s <Plug>(easymotion-s2)

"Cambio de tema
nmap <leader>1 :colorscheme gruvbox<CR>
nmap <leader>2 :colorscheme dracula<CR>
nmap <leader>3 :colorscheme base16-default-dark<CR> 
nmap <leader>4 :colorscheme hybrid_reverse<CR> 
nmap <leader>5 :colorscheme PaperColor<CR> 
nmap <leader>6 :colorscheme spacegray<CR>

nnoremap <C-l> :set background=light<CR>

"Modo focus
nnoremap <leader><ENTER> :Goyo<CR>

" Cuando odias el escape
inoremap jk <ESC>
inoremap kj <ESC>
inoremap ii <ESC>
inoremap II <ESC>
inoremap JK <ESC>
inoremap KJ <ESC>


"Mejor tabulacion
vnoremap < <gv
vnoremap > >gv

"Resize
nnoremap <M-k> :resize +2<CR> 
nnoremap <M-j> :resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>

"Configuracion de IndentLine
let g:indentLine_faster = 1 
"let g:indentLine_setConceal = 0
let g:indentLine_color_gui = '#777777'
let g:indentLine_conceallevel = 2
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"Configuracion de NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''
"Cierra automaticamente NVIM si NERDTree es lo unico que esta abierto
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>
"nmap <Leader>r :NERDTreeRefreshRoot
 
"Configuracion para la busqueda de archivos CTRL + P
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Abrir terminal con CTRL + N
nnoremap <c-n> :call OpenTerminal()<CR>

" Cambiar la terminal a modo NORMAL con ESC
tnoremap <Esc> <C-\><C-n>


" usa alt+hjkl para moverse entre paneles
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" Comienza una termina en modo de insercion
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction


