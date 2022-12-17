local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
	  motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»",
    separator = "",
    group = "",
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom",
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
  show_help = false,
  show_keys = false,
  triggers = "<leader>",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt"},
  },
}

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end

local mappings = {
  q = { ":q<cr>", " Quit" },
  H = { "<CMD>NvimTreeClose<CR><CMD>BDelete all<CR><CMD>Alpha<CR><CMD>BDelete all<CR><CMD>echo' Home'<CR>", " Home" },
  c = {
	name = "ךּ COC",
	e = { ":CocList extensions<cr>", "擄 Extensions" },
	u = { ":CocUpdate<cr>", " Update" },
  },
  w = { ":w<cr>", " Save" },
  e = { ":NvimTreeToggle<cr>", "פּ Tree" },
  s = { ":e ~/.config/nvim/init.lua<cr>", " Settings" },
  r = { ":Telescope live_grep<cr>", " Live Grep" },
  -- u = { ":TermExec size=10 direction=float cmd='sh ~/.config/nvim/script/update.sh && exit'<CR>", " Update" },
  t = {
	name = " Terminal",
    t = { ":ToggleTerm<cr>", "Horizontal" },
    m = { ":ToggleTerm size=45 direction=vertical<CR>", "Vertical" },
    f = { toggle_float, "Floating" },
    l = { toggle_lazygit, "LazyGit" }
  },
  g = {
	name = " Git",
	c = { ":Telescope git_commits<cr>", " Commits" },
	b = { ":Telescope git_branches<cr>", " Branches" },
	s = { ":Telescope git_status<cr>", " Status" },
  },
  i = {
	name = " UI",
	i = { "<CMD>IndentBlanklineToggle<CR>", " Indent Line" },
  },
  f = {
	name = " Files",
	n = { ":ene <BAR> startinsert <CR>", " New file" },
	f = { ":Telescope find_files<cr>", " Find Files" },
	r = { ":Telescope oldfiles<CR>", " Recent" },
  },
  l = {
    name = " LSP",
    i = { ":LspInfo<cr>", " LSP Info" },
    r = { ":LspRestart<cr>", " LSP Restart" },
    b = { ":LspStop<cr>", " LSP Stop" },
    s = { ":LspStart<cr>", " LSP Start" }
  },
  z = { ":ZenMode<cr>", " Zen Mode" },
  u = {
		name = "FPS",
		a = {"<CMD>let g:neovide_profiler = v:true<cr>", "Show FPS"},
		b = {"<CMD>let g:neovide_profiler = v:false<cr>", "Hide FPS"}
	},
  p = {
    name = "ﮣ Plugins",
    r = { ":PlugClean<cr>", "ﮁ Remove Unused Plugins" },
    e = { ":PlugDiff<cr>", " Examine Plugins" },
    i = { ":PlugInstall<cr>", " Install Plugins" },
    s = { ":PlugStatus<cr>", " Status Plugins" },
    u = { ":PlugUpdate<cr>", " Update Plugins" }
  },
  h = {
	name = " Themes",
	a = { ":silent colorscheme tokyodark | silent !echo 'vim.cmd [[ colorscheme tokyodark ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", " Tokyodark" },
	b = { ":silent colorscheme neon | silent !echo 'vim.cmd [[ colorscheme neon ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", " neon" },
	c = { ":silent colorscheme onenord | silent !echo 'vim.cmd [[ colorscheme onenord ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", " Onenord" },
	d = { ":silent colorscheme nord | silent !echo 'vim.cmd [[ colorscheme nord ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", " Nord" },
	e = {
		name = " Catppuccin",
		a = { ":silent colorscheme catppuccin-mocha | silent !echo 'vim.cmd [[ colorscheme catppuccin-mocha ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "Catppuccin Mocha" },
		b = { ":silent colorscheme catppuccin-latte | silent !echo 'vim.cmd [[ colorscheme catppuccin-latte ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "Catppuccin Latte" },
		c = { ":silent colorscheme catppuccin-frappe | silent !echo 'vim.cmd [[ colorscheme catppuccin-frappe ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "Catppuccin Frappe" },
		d = { ":silent colorscheme catppuccin-macchiato | silent !echo 'vim.cmd [[ colorscheme catppuccin-macchiato ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "Catppuccin Macchiato" },
	},
	f = {
		name = " GitHub",
		a = { ":silent colorscheme github_dark | silent !echo 'vim.cmd [[ colorscheme github_dark ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "github_dark" },
		b = { ":silent colorscheme github_dimmed | silent !echo 'vim.cmd [[ colorscheme github_dimmed ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "github_dimmed" },
		c = { ":silent colorscheme github_dark_default | silent !echo 'vim.cmd [[ colorscheme github_dark_default ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "github_dark_default" },
		d = { ":silent colorscheme github_dark_colorblind | silent !echo 'vim.cmd [[ colorscheme github_dark_colorblind ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "github_dark_colorblind" },
		e = { ":silent colorscheme github_light | silent !echo 'vim.cmd [[ colorscheme github_light ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "github_light" },
		f = { ":silent colorscheme github_light_default | silent !echo 'vim.cmd [[ colorscheme github_light_default ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "github_light_default" },
		g = { ":silent colorscheme github_light_colorblind | silent !echo 'vim.cmd [[ colorscheme github_light_colorblind ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "github_light_colorblind" },
	},
	g = {
		name = "ﱦ OneDark",
		a = { ":silent colorscheme onedark | silent !echo 'vim.cmd [[ colorscheme onedark ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "OneDark" },
	},
	h = {
		name = "﫛 Gruvbox",
		a = { ":silent colorscheme gruvbox | set background=dark | silent !echo 'vim.cmd [[ colorscheme gruvbox | set background=dark ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "Gruvbox Dark" },
		b = { ":silent colorscheme gruvbox | set background=light | silent !echo $'vim.cmd [[ colorscheme gruvbox | set background=light ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "Gruvbox Light" },
		c = { ":silent colorscheme gruvbox-baby | silent !echo $'vim.cmd [[ colorscheme gruvbox-baby ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "Gruvbox Baby" },
	},
	i = {
		name = " TokyoNight",
		a = { ":silent colorscheme tokyonight-night | silent !echo 'vim.cmd [[ colorscheme tokyonight-night ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "TokyoNight Night" },
		b = { ":silent colorscheme tokyonight-storm | silent !echo 'vim.cmd [[ colorscheme tokyonight-storm ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "TokyoNight Storm" },
		c = { ":silent colorscheme tokyonight-day | silent !echo 'vim.cmd [[ colorscheme tokyonight-day ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "TokyoNight Day" },
		d = { ":silent colorscheme tokyonight-moon | silent !echo 'vim.cmd [[ colorscheme tokyonight-moon ]]' > ~/.config/nvim/lua/theme/theme.lua<CR>", "Tokyo Night Moon" },
	},
  },
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
