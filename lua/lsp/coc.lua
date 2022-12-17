vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.updatetime = 300

vim.opt.signcolumn = "yes"

vim.cmd([[ let g:coc_global_extensions = [ 'coc-pairs', 'coc-snippets', 'coc-clangd', 'coc-pyright', 'coc-tsserver', 'coc-html', 'coc-go', 'coc-json', 'coc-vimlsp', 'coc-css', 'coc-rust-analyzer'] ]])

local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

vim.cmd([[
hi CocSearch ctermfg=12 guifg=#4fa6ed " Cor do texto digitado
" hi CocMenuSel ctermbg=109 guibg=#181b20 " Cor do fundo
]])

