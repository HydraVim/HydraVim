icon = ' LSP:'

local function lsp_p()
    local msg = ': No LSP'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return string.format(": %s", client.name)
      end
    end
    return msg
  end

require('lualine').setup {
  options = {
	symbols = { added = ' ', modified = ' ', removed = ' ', error = ' ', warn = ' ', info = ' ', hint = ' '},
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
disabled_filetypes = {
      'NvimTree','alpha',
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
    lualine_a = {{icon = '', 'mode'}},
    lualine_b = {{ icon = '','branch'}},
    lualine_x = {'diagnostics', 'filetype'},
    lualine_y = {{ lsp_p }},
    lualine_z = {{'progress', icon = ''}},
    lualine_c = {'diff'}
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
