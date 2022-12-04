" aris's nvim config

" vim-plug
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " Colorscheme
	Plug 'morhetz/gruvbox', { 'branch': 'master' } " Colorscheme 2
	Plug 'arcticicestudio/nord-vim' " Colorscheme 3
	Plug 'glepnir/dashboard-nvim' " Start screen (if ran only 'nvim')
	Plug 'nvim-lua/plenary.nvim' " telescope.nvim dependency
	Plug 'nvim-telescope/telescope.nvim' " to search for files in dashboard
	Plug 'itchyny/lightline.vim'
	Plug 'kyazdani42/nvim-web-devicons' " for file icons
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'preservim/vimux'
	Plug 'karb94/neoscroll.nvim'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'akinsho/bufferline.nvim'
	Plug 'rhysd/git-messenger.vim'
	Plug 'stevearc/aerial.nvim'
	Plug 'APZelos/blamer.nvim'
	Plug 'moll/vim-bbye'
	Plug 'voldikss/vim-floaterm'
	Plug 'sindrets/diffview.nvim'
	Plug 'ThePrimeagen/git-worktree.nvim'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'sam4llis/nvim-tundra'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'vimsence/vimsence'
call plug#end()

" General
set number
set mouse=a
set ts=4
set sw=4
set noshowmode

"
"	Plugin Config
"

" Config: TokyoNight
let g:tokyonight_style = "night"
let g:tokyonight_terminal_colors = 1
let g:tokyonight_italic_comments = 1
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_variables = 1

luafile ~/.config/nvim/tundracolors.lua

colorscheme tundra

" Config: Lualine
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '|',
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode', separator = { left = '' }, right_padding = 2 },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END


" Config: telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Config: dashboard.nvim
luafile ~/.config/nvim/dashboardconfig.lua

" Config: Vim-airline
let g:airline#extensions#tabline#enabled = 1


" Config: vim-airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''

" Config: floaterm
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let floaterm_title='($1/$2)'

" Config: nerdtree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=40
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'~',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeStatusline = '%#NonText#'
" let g:NERDTreeMinimalUI = 1

augroup nerdtreeconcealbrackets
      autocmd!
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
      autocmd FileType nerdtree setlocal conceallevel=3
      autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END
augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end

lua require("nvim-tree").setup()
nnoremap <leader>ft :NvimTreeToggle<CR>

" Config: blamer
let g:blamer_show_in_visual_modes = 0
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_relative_time = 1
let g:blamer_prefix = '    ■ '
let g:blamer_template = '<committer>, <committer-time>: <summary>'
let g:blamer_show_in_insert_modes = 0

" Config: git-messenger
let g:git_messenger_include_diff = 'none'
let g:git_messenger_floating_win_opts = { 'border': 'single' }
let g:git_messenger_popup_content_margins = v:false
let g:git_messenger_always_into_popup = v:true

