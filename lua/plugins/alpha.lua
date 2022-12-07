local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")


dashboard.section.header.val =
{
 [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],}
dashboard.section.buttons.val = {
    dashboard.button( "1", "  - New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "2", "  - Find file", ":Telescope find_files<CR>"),
    dashboard.button( "3", "  - Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "4", "  - Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k <CR>"),
    dashboard.button( "5", "  - Quit", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
