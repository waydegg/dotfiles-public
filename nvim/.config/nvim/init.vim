" Plugins
call plug#begin()

Plug 'phaazon/hop.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'jpalardy/vim-slime'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'
Plug 'christoomey/vim-tmux-navigator', {'commit': '9ca5bfe5bd274051b5dd796cc150348afc993b80'}
Plug 'numToStr/Comment.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'dag/vim-fish'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nanotee/sqls.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'jbyuki/one-small-step-for-vimkind'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rmagatti/auto-session'
Plug 'kevinhwang91/nvim-ufo', { 'commit': '1501a5c324bd6355de46de3200db4dc2ed120ffe'}
Plug 'kevinhwang91/promise-async', {'commit': '3fac3a5a3e2c63d09a30ff7e983a1a5e867043c4'}
Plug 'simrat39/symbols-outline.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'j-hui/fidget.nvim'

call plug#end()

lua require("config.plugins.nvim-tree")
lua require("config.plugins.gitsigns")
lua require("config.plugins.cmp")
lua require("config.plugins.hop")
lua require("config.plugins.telescope")
lua require("config.plugins.treesitter")
lua require("config.plugins.lspconfig")
lua require("config.plugins.dap")
lua require("config.plugins.autopairs")
lua require("config.plugins.null-ls")
lua require("config.plugins.trouble")
lua require("config.plugins.lspsaga")
lua require("config.plugins.comment")
lua require("config.plugins.auto-session")
lua require("config.plugins.fidget")

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
set textwidth=0
set guioptions-=m
set gdefault
set pumheight=10
set foldcolumn=0
set foldlevel=99
set foldenable
set nowrap
set background=light
set laststatus=3

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

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

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

" Toggle diagnostics window
nnoremap <leader>tt <cmd>TroubleToggle<cr>
nnoremap <leader>tb <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>tr <cmd>TroubleReload<cr>

" Toggle comment
nnoremap gc <plug>(comment_toggle_current_linewise)
vnoremap gc <plug>(comment_toggle_linewise_visual)
