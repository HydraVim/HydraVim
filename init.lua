-- plugins
require ('plugins.vim_plug')
-- require ('plugins.packer')

-- config
require ('config.autosave')
require ('config.mappings')
require ('config.settings')
-- require ('config.comment')

-- lsp
-- require ('lsp.coc')
require ('lsp.cmp')
require ('lsp.treesitter')
require ('lsp.lsp_config')

-- plugins config
require ('plugins.alpha')
require ('plugins.vim_multi')
require ('plugins.buffer')
require ('plugins.colorizer')
require ('plugins.comment')
require ('plugins.gitsigns')
require ('plugins.indent_line')
require ('plugins.lualine')
require ('plugins.nvim_tree')
require ('plugins.telescope')
require ('plugins.toggleterm')
require ('plugins.which_key')
require ('plugins.autopairs')

-- temas
require ('theme.theme')
