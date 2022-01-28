" --- Options -----------------------------------------------------------------

set clipboard=unnamedplus
set number
set scrolloff=8
set sidescrolloff=8
set mouse=a
set noshowmode
set showtabline=2
set ignorecase
set smartcase
set splitbelow
set undofile
set updatetime=300
set expandtab
set shiftwidth=2
set tabstop=2
set cursorline
set signcolumn=yes
set termguicolors
set formatoptions-=cro


" --- Mappings ----------------------------------------------------------------

let mapleader=" "
let maploacalleader=" "

" Escape normal mode
inoremap jk <esc> 
inoremap <esc> <nop>

" Source init.vim and all plugin scripts
function SourcePlugins()
  for f in split(glob('~/.config/nvim/plugin/*.vim'), '\n')
    execute "source" f
  endfor
endfunction

nnoremap <silent> <leader>sv :source $MYVIMRC <cr> <bar> :call SourcePlugins()<cr>

" Open file explorer
nnoremap <silent> <leader>e :Lexplore 30<cr>

" Select all
nnoremap <c-a> ggVG

" Better window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-w>h <nop>
nnoremap <c-w>j <nop>
nnoremap <c-w>k <nop>
nnoremap <c-w>l <nop>

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Disable paste from overriding register/clipboard
vnoremap p _dP


" --- Autocommands ------------------------------------------------------------

augroup highlight_yank
    autocmd!
    au textyankpost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END

" --- Plugins -----------------------------------------------------------------

" Install vim-plug if not installed already
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  echo 'No vim-plug installation found. Installing from source...'
  silent execute '!curl -fL --create-dirs -o ' . autoload_plug_path . ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  execute 'source ' . fnameescape(autoload_plug_path)
endif

call plug#begin()

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Colorscheme
Plug 'overcache/NeoSolarized' 
Plug 'gruvbox-community/gruvbox'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

call plug#end()

