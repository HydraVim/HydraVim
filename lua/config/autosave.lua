vim.cmd([[
autocmd BufNewFile,BufRead *.md :autocmd TextChanged,TextChangedI <buffer> silent write
autocmd BufNewFile,BufRead *.js :autocmd TextChanged,TextChangedI <buffer> silent write
autocmd BufNewFile,BufRead *.css :autocmd TextChanged,TextChangedI <buffer> silent write
autocmd BufNewFile,BufRead *.html :autocmd TextChanged,TextChangedI <buffer> silent write
autocmd BufNewFile,BufRead *.php :autocmd TextChanged,TextChangedI <buffer> silent write
autocmd BufNewFile,BufRead *.rb :autocmd TextChanged,TextChangedI <buffer> silent write
autocmd BufNewFile,BufRead *.erb :autocmd TextChanged,TextChangedI <buffer> silent write
]])
