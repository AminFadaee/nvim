" Plugins
call plug#begin('~/.vim/plugged')

" Ale Plugin: Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Airline Plugin: Status Bar and Tabline
Plug 'vim-airline/vim-airline'

" NerdTree: File Browser Plugin
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Formatter Plugin: Google Vim Codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Highlight Yanking
Plug 'machakann/vim-highlightedyank'

" Surround Plugin
Plug 'tpope/vim-surround'

" Tabnine: Smart Auto Complete
Plug 'codota/tabnine-vim'

" Python Syntax Highlighter
" pip install pynvim
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Plugin for Brackets, Parens and Quotes Pair
Plug 'jiangmiao/auto-pairs'

" Plugin for Commneting, use gc
Plug 'tpope/vim-commentary'

" Text Objects and Motions for Python
Plug 'jeetsukumaran/vim-pythonsense'

" Colorscheme Plugin
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Search Plugin
Plug 'eugen0329/vim-esearch'
 
" Fugitive: Git Plugin
Plug 'tpope/vim-fugitive'

" Virtual Env
Plug 'jmcantrell/vim-virtualenv'

" Auto Complete for Python: Jedi
" pip install jedi, neovim
Plug 'davidhalter/jedi-vim'

call plug#end()

" Compatibility with Vi
set nocompatible

" Enable syntax
syntax on

" Finding Files
set path+=**
set wildmenu
set wildmode=list,full

" Global ClipBoard
set clipboard=unnamed

" Jump to the Last Position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Line Numbers
set hlsearch
set number
set relativenumber

" Position of New Splits
set splitbelow
set splitright

" Enable Mouse
set mouse=a

" Tab Configurations
nmap <leader>1 :bfirst<CR>
nmap <leader>2 :bfirst<CR>:bn<CR>
nmap <leader>3 :bfirst<CR>:2bn<CR>
nmap <leader>4 :bfirst<CR>:3bn<CR>
nmap <leader>5 :bfirst<CR>:4bn<CR>
nmap <leader>6 :bfirst<CR>:5bn<CR>
nmap <leader>7 :bfirst<CR>:6bn<CR>
nmap <leader>8 :bfirst<CR>:7bn<CR>
nmap <leader>9 :bfirst<CR>:8bn<CR>

" Folding Config
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=99

" Configs for Terminal
command! Term 15sp term://zsh
command! VTerm 50vsp term://zsh
cnoreabbrev sterm Term
cnoreabbrev vterm VTerm
tnoremap <Esc> <C-\><C-n>

" Colorscheme Configs
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
if (has('termguicolors'))
  set termguicolors
endif
let g:airline_theme = 'material'
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

" Line Numbers Coloring
highlight CursorLineNr guifg=yellow
highlight LineNr guifg=#BBBBBB

" Search Highlight
highlight Search guibg=yellow guifg=black

" Visual Mode Highlight
highlight Visual guibg=gold guifg=black

" Config for Yanking Highlight
highlight HighlightedyankRegion guifg=white guibg=#2F4F4F
let g:highlightedyank_highlight_duration = 800

" Disable Pair Matching Highlight
let g:loaded_matchparen=1

" Disable Wrapping
set nowrap

" Set Guide Line
set colorcolumn=120
highlight ColorColumn guibg=#353535

" Fugitive Configs
set diffopt+=vertical

" Ariline Configs
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep='◣'
let g:airline_right_sep='◢'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.dirty=' ★'
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = '✗ '
let airline#extensions#ale#warning_symbol = '！'

" Jedi Config
let g:jedi#show_call_signatures = "0"

" Key Mappings for Plugins
map <F9> :NERDTreeToggle<CR> " File Browser Toggle
map <C-A-r> :FormatCode<CR> " Format Code

" Create Tags
command! MakeTags !ctags -R .

" Debugging Helper
command! Bullet :normal Oimport web_pdb; web_pdb.set_trace()<ESC> " Use for python debugging, pip install web_pdb
nnoremap ,b :Bullet<CR> " Set Breakpoint
