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
function ReloadPluginScripts()
  for f in split(glob('~/.config/nvim/plugin/*'), '\n')
    let ext = f[-3:]
    if ext == "vim"
      execute "source" f
    elseif ext == "lua"
      let b:f_module_name = split(f[:-5], "/")[-1]
      let b:f_module_path = join(["./plugin", b:f_module_name], "/")
      lua require("plenary.reload").reload_module(vim.b.f_module_path)
      lua require(vim.b.f_module_path)
    endif
  endfor
endfunction
command ReloadPluginScripts call ReloadPluginScripts()
nnoremap <silent> <leader>sv :source $MYVIMRC <cr> <bar> :ReloadPluginScripts<cr>

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

" Toggle maximizing a window
function ToggleMaximizedWindow()
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command ToggleMaximizedWindow call ToggleMaximizedWindow()
nnoremap <silent> <leader>m :ToggleMaximizedWindow<cr>

" Navigate buffers
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>

" Close the current buffer
nnoremap <leader>cb :bd<cr>


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
" Plug 'williamboman/nvim-lsp-installer'

" Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Bufferline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

Plug 'tpope/vim-commentary'

call plug#end()

