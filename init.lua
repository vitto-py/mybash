vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- LSP enable
vim.lsp.enable('pyright')
require('lsp.pyright')

vim.lsp.enable('lua_ls')
require('lsp.lua_ls')

require("config.lazy")
