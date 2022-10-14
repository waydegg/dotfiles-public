" Plugins
call plug#begin()

" Core
Plug 'nvim-lua/plenary.nvim'

" Filetree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" Language-specific plugins
Plug 'dag/vim-fish'
Plug 'windwp/nvim-ts-autotag'
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

" Misc
Plug 'phaazon/hop.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'jpalardy/vim-slime'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'numToStr/Comment.nvim', { 'commit': 'fe9bbdbcd2f1b85cc8fccead68122873d94f8397' }
Plug 'L3MON4D3/LuaSnip'
Plug 'glepnir/lspsaga.nvim'
Plug 'kevinhwang91/nvim-ufo', {'commit': '1501a5c324bd6355de46de3200db4dc2ed120ffe'}
Plug 'kevinhwang91/promise-async', {'commit': '3fac3a5a3e2c63d09a30ff7e983a1a5e867043c4'}

" Plug 'junegunn/fzf', {'do': { -> fzf#install() }, 'commit': 'b9e6e7926cb8400ad56de60f66d6b4fc2b391c6e'}
" Plug 'junegunn/fzf.vim', {'commit': 'ecbf9cd98e65e9170ef743d229f35bf1306efde1'}

Plug 'dhruvasagar/vim-zoom', {'commit': '9f281ac7766c3931cb87698602eeb33a62660ae2'}
Plug 'christoomey/vim-tmux-navigator', {'commit': 'afb45a55b452b9238159047ce7c6e161bd4a9907'}
Plug 'rmagatti/auto-session' 
Plug 'simrat39/symbols-outline.nvim'

call plug#end()

set rtp+=/opt/homebrew/opt/fzf

lua require("config.plugins.nvim-tree")
lua require("config.plugins.gitsigns")
lua require("config.plugins.cmp")
lua require("config.plugins.hop")
lua require("config.plugins.treesitter")
lua require("config.plugins.lspconfig")
lua require("config.plugins.autopairs")
lua require("config.plugins.null-ls")
lua require("config.plugins.lspsaga")
lua require("config.plugins.comment")
lua require("config.plugins.nvim-web-devicons")
lua require("config.plugins.tmux")
lua require("config.plugins.fzf")
lua require("config.plugins.symbols-outline")
lua require("config.plugins.telescope")

" Options
set clipboard=unnamedplus
set number
set numberwidth=4
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
set guioptions-=m
set gdefault
set pumheight=10
set foldcolumn=0
set foldlevel=99
set foldenable
set nowrap
set background=light
set laststatus=3
set sessionoptions+=tabpages,globals

" Colorscheme
colorscheme solarized

lua require("config.autocmd")

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

" Horizontal split
nnoremap <c-w>b <c-w>s

" Stay in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Replace selected text without replacing the clipboard
vnoremap p "_dP

" Navigate buffers
nnoremap gb <cmd>bnext<cr>
nnoremap gB <cmd>bprevious<cr>

" Close the current buffer
nnoremap <leader>cb <cmd>bp<bar>sp<bar>bn<bar>bd<cr>

" Vim Plug
nnoremap <leader>pi <cmd>PlugInstall<cr>
nnoremap <leader>ps <cmd>PlugStatus<cr>
nnoremap <leader>pc <cmd>PlugClean<cr>

" Nvim Tree
nnoremap <leader>e <cmd>NvimTreeToggle<cr>

" Gitsigns
nnoremap <leader>gh <cmd>Gitsigns preview_hunk<cr>

" Hop
nnoremap f <cmd>HopWord<cr>
nnoremap F <cmd>HopLine<cr>
vnoremap f <cmd>HopWord<cr>
vnoremap F <cmd>HopLine<cr>

" FZF
nnoremap <leader>ff <cmd>FzfFiles<cr>
nnoremap <leader>fg <cmd>FzfGrep<cr>
nnoremap <leader>fb <cmd>FzfBuffers<cr>

" Show LSP info
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap gh <cmd>lua vim.lsp.buf.hover()<cr>

" Debugger
nnoremap <leader>db <cmd>lua require("dap").toggle_breakpoint()<cr>
nnoremap <leader>dc <cmd>lua require("dap").continue()<cr>
nnoremap <leader>ds <cmd>lua require("dap").step_over()<cr>
nnoremap <leader>dr <cmd>lua require("dap").repl.toggle()<cr>
nnoremap <leader>dl <cmd>lua require("dap").list_breakpoints()<cr>

" Slime
nnoremap <leader>s <plug>SlimeSendCell

" Toggle comment
nnoremap gc <plug>(comment_toggle_current_linewise)
vnoremap gc <plug>(comment_toggle_linewise_visual)

" Rename (LSP)
nnoremap R <cmd>Lspsaga rename<cr>

" Go to start/end of line
nnoremap H ^
nnoremap L g_

" Jump to tabpage
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" Rename tabpage
nnoremap <leader>, <cmd>lua require("config.ui.tabline").rename_tabline_label()<cr>

" Move window to its own tab
nnoremap T <c-w>T

" Zoom window
nnoremap <leader>m <plug>(zoom-toggle)

nnoremap <leader>o <cmd>SymbolsOutline<cr>
