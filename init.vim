" aris's nvim config

" vim-plug
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " Colorscheme
	Plug 'glepnir/dashboard-nvim' " Start screen (if ran only 'nvim')
	Plug 'nvim-lua/plenary.nvim' " telescope.nvim dependency
	Plug 'nvim-telescope/telescope.nvim' " to search for files in dashboard
	Plug 'itchyny/lightline.vim' " vim-airline replacement
	Plug 'kyazdani42/nvim-web-devicons' " for file icons
	Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

" General
set number
set mouse=a

" Colorscheme
let g:tokyonight_style = "storm"
let g:tokyonight_terminal_colors = 1
let g:tokyonight_italic_comments = 1
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_variables = 1
			
colorscheme tokyonight

let g:lightline = {'colorscheme': 'tokyonight'}

" telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" dashboard-nvim
let g:dashboard_default_executive = 'telescope'

nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_header = [
	\ '',
	\ ' █████╗ ██████╗ ██╗███████╗████████╗ ██████╗ ███╗   ██╗    ',
	\ '██╔══██╗██╔══██╗██║██╔════╝╚══██╔══╝██╔═══██╗████╗  ██║    ',
	\ '███████║██████╔╝██║███████╗   ██║   ██║   ██║██╔██╗ ██║    ',
	\ '██╔══██║██╔══██╗██║╚════██║   ██║   ██║   ██║██║╚██╗██║    ',
	\ '██║  ██║██║  ██║██║███████║   ██║   ╚██████╔╝██║ ╚████║    ',
	\ '╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝    ',
	\ '',
	\ ] 

" Nvim Tree

luado require'nvim-tree'.setup()

nnoremap <leader>ft :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
