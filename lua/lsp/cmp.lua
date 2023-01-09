local present, cmp = pcall(require, "cmp")

if not present then
    return
end

local kind = cmp.lsp.CompletionItemKind

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}





cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
	-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	require('snippy').expand_snippet(args.body) -- For `snippy` users.
  end,
},

window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},

mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },

}),


sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = "path" },
  -- { name = 'vsnip' }, -- For vsnip users.
  -- { name = 'luasnip' }, -- For luasnip users.
  -- { name = 'ultisnips' }, -- For ultisnips users.
  { name = 'snippy' }, -- For snippy users.
}, {
  { name = 'buffer' },
}),

formatting = {
format = function(entry, vim_item)
  vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
  -- Source
  vim_item.menu = ({
	buffer = "",
	nvim_lsp = "",
	luasnip = "",
	nvim_lua = "",
	latex_symbols = "",
  })[entry.source.name]
  return vim_item
end
},


})



-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
-- sources = cmp.config.sources({
--   { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
-- }, {
--   { name = 'buffer' },
-- })
-- })

-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = {
--   { name = 'buffer' }
-- }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = cmp.config.sources({
--   { name = 'path' }
-- }, {
--   { name = 'cmdline' }
-- })
-- })

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
-- capabilities = capabilities
-- }
--

-- cmp.event:on("confirm_done", function(event)
--   local item = event.entry:get_completion_item()
--   local parensDisabled = item.data and item.data.funcParensDisabled or false
--   if not parensDisabled and (item.kind == kind.Method or item.kind == kind.Function) then
--     require("pairs.bracket").type_left("(")
--   end
-- end)
