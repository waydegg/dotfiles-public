" --- Plugins -----------------------------------------------------------------
call plug#begin()

Plug 'nvim-lualine/lualine.nvim'
Plug 'phaazon/hop.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'jpalardy/vim-slime'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/trouble.nvim'
Plug 'aserowy/tmux.nvim'
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
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'
Plug 'simrat39/symbols-outline.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

call plug#end()


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

" --- Autocommands ------------------------------------------------------------
augroup highlight_yank
    autocmd!
    autocmd textyankpost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END

augroup telescope_fold_fix
  autocmd!
  autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
augroup end

" --- Colorscheme -------------------------------------------------------------
colorscheme solarized


" =============================================================================
" ======================== Plugin Settings ====================================
" =============================================================================

" -- Vim Plug -----------------------------------------------------------------
nnoremap <leader>pi <cmd>PlugInstall<cr>
nnoremap <leader>ps <cmd>PlugStatus<cr>
nnoremap <leader>pc <cmd>PlugClean<cr>

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
lua require("config.gitsigns")

nnoremap <leader>gh <cmd>Gitsigns preview_hunk<cr>

" --- CMP ---------------------------------------------------------------------
lua require("config.cmp")

" --- Hop ---------------------------------------------------------------------
lua require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

nnoremap f <cmd>HopWord<cr>
nnoremap F <cmd>HopLine<cr>
vnoremap f <cmd>HopWord<cr>
vnoremap F <cmd>HopLine<cr>

" --- Telescope ---------------------------------------------------------------
lua require("config.telescope")

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" --- Treesitter --------------------------------------------------------------
lua require("config.treesitter")

" --- Lualine -----------------------------------------------------------------
lua require("config.lualine") 

" --- LSP Config --------------------------------------------------------------
lua require("config.lspconfig")

nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap gh <cmd>lua vim.lsp.buf.hover()<cr>

" --- DAP ---------------------------------------------------------------------
lua require("config.dap")

nnoremap <leader>db <cmd>lua require("dap").toggle_breakpoint()<cr>
nnoremap <leader>dc <cmd>lua require("dap").continue()<cr>
nnoremap <leader>ds <cmd>lua require("dap").step_over()<cr>
nnoremap <leader>dr <cmd>lua require("dap").repl.toggle()<cr>
nnoremap <leader>dl <cmd>lua require("dap").list_breakpoints()<cr>

" --- Autopairs ---------------------------------------------------------------
lua require("config.autopairs")

" --- Slime -------------------------------------------------------------------
let g:slime_target = 'tmux'
" let g:slime_no_mappings = 'true'
let g:slime_dont_ask_default = 1
let b:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_paste_file = tempname()

nnoremap <leader>s <plug>SlimeSendCell

" --- Null-ls ------------------------------------------------------------------
lua require("config.null-ls")

" --- Trouble  ------------------------------------------------------------------
lua require("config.trouble")

nnoremap <leader>tt <cmd>TroubleToggle<cr>
nnoremap <leader>tb <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>tr <cmd>TroubleReload<cr>

lua require("config.lspsaga")
lua require("config.tmux")

lua require("config.comment")

nnoremap gc <plug>(comment_toggle_current_linewise)
vnoremap gc <plug>(comment_toggle_linewise_visual)
