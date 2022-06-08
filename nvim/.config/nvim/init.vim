" --- Plugins -----------------------------------------------------------------
call plug#begin()
  
Plug 'nvim-lualine/lualine.nvim'
Plug 'phaazon/hop.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-dadbod'
Plug 'dag/vim-fish'
Plug 'jpalardy/vim-slime'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Nvim Tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Completions
Plug 'hrsh7th/nvim-cmp'
" Plug '~/ghq/github.com/hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'

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

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'jbyuki/one-small-step-for-vimkind'
Plug 'mfussenegger/nvim-dap-python'


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
set textwidth=80
set guioptions-=m
set gdefault
set pumheight=10
 
set foldmethod=indent
set nofoldenable
set foldlevel=99

" --- Autocommands ------------------------------------------------------------
augroup highlight_yank
    autocmd!
    autocmd textyankpost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END

function! GetPotionFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif

  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    return '>' . next_indent
  endif
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1

  while current <= numlines
      if getline(current) =~? '\v\S'
          return current
      endif

      let current += 1
  endwhile

  return -2
endfunction

function! CustomFoldText()
  " get first non-blank line
  let fs = v:foldstart

  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile

  if fs > v:foldend
      let line = getline(v:foldstart)
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
  return line . expansionString . foldSizeStr . foldLevelStr
endfunction

augroup custom_folding
  autocmd!
  autocmd FileType typescript,javascript setlocal fillchars=fold:\
  autocmd FileType typescript,javascript setlocal foldtext=CustomFoldText()
  autocmd FileType typescript,javascript setlocal foldmethod=expr 
  autocmd FileType typescript,javascript setlocal foldexpr=GetPotionFold(v:lnum)
augroup END


" --- Colorscheme -------------------------------------------------------------

set background=light

colorscheme NeoSolarized

" Hide '~' characters at the end of buffers
highlight! EndOfBuffer guibg=bg guifg=bg

" Make number background transparent
highlight! clear LineNr


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
lua require("gitsigns").setup({})

nnoremap <leader>gh <cmd>Gitsigns preview_hunk<cr>

" --- CMP ---------------------------------------------------------------------
lua require("config.cmp")

highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6

highlight! CmpItemKindVariable guibg=NONE guifg=#76B6D8
highlight! CmpItemKindInterface guibg=NONE guifg=#76B6D8
highlight! CmpItemKindText guibg=NONE guifg=#76B6D8
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

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
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_paste_file = tempname()
let g:slime_cell_delimiter = '# @@'

nnoremap <leader>s <plug>SlimeSendCell

" --- Null-ls ------------------------------------------------------------------
lua require("config.null-ls")
