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
set foldlevelstart=99
set foldmethod=expr


" --- Mappings ----------------------------------------------------------------

let mapleader=" "
let maploacalleader=" "

" Disable normal space
nnoremap <space> <nop>

" Escape normal mode
inoremap jk <esc>
inoremap <esc> <nop>

" Source init.vim and all plugin scripts
function ReloadConfigFiles()
  for current_dir in ['./plugin', './after/plugin']
    for current_file in split(glob('~/.config/nvim' . current_dir[1:] . '/*'), '\n')
      let ext = current_file[-3:]
      if ext == 'vim'
        execute 'source' current_file
      " this isn't working atm
      elseif ext == 'lua'
        let b:current_module = current_dir . '/' . split(current_file[:-5], '/')[-1]
        lua require('plenary.reload').reload_module(vim.b.current_module)
        lua require(vim.b.current_module)
      endif
    endfor
  endfor
endfunction
command ReloadConfigFiles call ReloadConfigFiles()
nnoremap <silent> <leader>sv :source $MYVIMRC<cr><bar>:ReloadConfigFiles<cr>

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
nnoremap <silent> <s-h> :bprevious<cr>
nnoremap <silent> <s-l> :bnext<cr>

" Close the current buffer
nnoremap <leader>cb :bd<cr>


" --- Autocommands ------------------------------------------------------------

augroup highlight_yank
    autocmd!
    au textyankpost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END


" --- Plugins -----------------------------------------------------------------

call plug#begin()

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Colorschemes
Plug 'overcache/NeoSolarized'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'lunarvim/darkplus.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

" Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'kristijanhusak/vim-dadbod-completion'

" Bufferline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

" NVIM Tree
Plug 'kyazdani42/nvim-tree.lua'

" Dadbod
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Trouble
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'

Plug 'tpope/vim-fugitive'

Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'NTBBloodbath/rest.nvim'

" Fish syntax highlighting
Plug 'dag/vim-fish'

call plug#end()

