vim.cmd([[
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/vim.plug')

	Plug 'kazhala/close-buffers.nvim'
	Plug 'terrortylor/nvim-comment'
	Plug 'nvim-treesitter/nvim-treesitter',
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
	Plug 'lewis6991/gitsigns.nvim'
	Plug 'sheerun/vim-polyglot'
	Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
	Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'goolord/alpha-nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'honza/vim-snippets'
	Plug 'mg979/vim-visual-multi'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'folke/which-key.nvim'
	Plug 'folke/zen-mode.nvim'
	Plug 'rcarriga/nvim-notify'
	Plug 'wakatime/vim-wakatime'
	Plug 'rust-lang/rust.vim'
	Plug 'andweeb/presence.nvim'
	Plug 'chentoast/marks.nvim'

	" temas --
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'projekt0n/github-nvim-theme'
	Plug 'navarasu/onedark.nvim'
	Plug 'tiagovla/tokyodark.nvim'
	Plug 'folke/tokyonight.nvim'
	Plug 'ellisonleao/gruvbox.nvim'
	Plug 'luisiacc/gruvbox-baby'
	Plug 'rafamadriz/neon'
	Plug 'shaunsingh/nord.nvim'
    Plug 'rmehri01/onenord.nvim'

call plug#end()
]])
