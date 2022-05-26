" --- Plugins -----------------------------------------------------------------
call plug#begin()

Plug 'nvim-lualine/lualine.nvim'
Plug 'phaazon/hop.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Nvim Tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Colors
Plug 'overcache/NeoSolarized'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

" --- Colorscheme -------------------------------------------------------------

set background=light

colorscheme NeoSolarized

" Hide '~' characters at the end of buffers
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" --- Keybinds ----------------------------------------------------------------
let mapleader = ' '
let maplocalleader = ' '

" Source init.vim
nnoremap <silent> <leader>r <cmd>source $MYVIMRC<cr>

" Disable <space> in normal mode
nnoremap <space> <nop>

" Exit insert mode
inoremap jk <esc>l
inoremap <esc> <nop>

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

" Horizontal split
nnoremap <c-w>b <c-w>s

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Disable paste from overriding register/keyboard
vnoremap p _dP

" Navigate buffers
nnoremap <s-h> <cmd>bprevious<cr>
nnoremap <s-l> <cmd>bnext<cr>

" Close the current buffer
nnoremap <leader>cb <cmd>bp<bar>sp<bar>bn<bar>bd<cr>


" --- Options -----------------------------------------------------------------
set clipboard=unnamedplus
set number
set numberwidth=6
set scrolloff=10
set sidescrolloff=10
set mouse=a
set noshowmode
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
set formatoptions=jtcroql
set textwidth=80
set guioptions-=m
set gdefault


" --- Autocommands ------------------------------------------------------------
augroup highlight_yank
    autocmd!
    au textyankpost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END

augroup set_fish_commentstring
  autocmd!
  autocmd FileType fish setlocal commentstring=#\ %s
augroup END

" =============================================================================
" ======================== Plugin Settings ====================================
" =============================================================================

" --- Zoom --------------------------------------------------------------------
if exists('g:loaded_zoom')
  finish
endif
let g:loaded_zoom = 1
if !exists('g:zoom_tmux_z')
  let g:zoom_tmux_z = v:false
endif

nnoremap <silent> <plug>(zoom-toggle) :call zoom#toggle()<CR>

if !hasmapto('<Plug>(zoom-toggle)')
  nmap <leader>m <Plug>(zoom-toggle)
endif
if empty($TMUX) && g:zoom_tmux_z == v:true
  nmap <C-W>z <Plug>(zoom-toggle)
endif

" --- Nvim Tree ---------------------------------------------------------------
lua require("config.nvim-tree")

let g:nvim_tree_group_empty = 1

nnoremap <leader>e <cmd>NvimTreeToggle<cr>

" --- Gitsigns ----------------------------------------------------------------
lua require("gitsigns").setup({})

nnoremap <leader>gh <cmd>Gitsigns preview_hunk<cr>

" --- CMP ---------------------------------------------------------------------
lua require("config.cmp")

" --- Hop ---------------------------------------------------------------------
lua require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

nnoremap f <cmd>HopWord<cr>
nnoremap F <cmd>HopLine<cr>

" --- Telescope ---------------------------------------------------------------
lua require("config.telescope")

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" --- Treesitter --------------------------------------------------------------
lua require("config.treesitter")

" --- Lualine -----------------------------------------------------------------
lua require("config.lualine") 





