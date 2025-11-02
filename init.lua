vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set relativenumber")
-- merge both clipboards
vim.cmd("set clipboard+=unnamedplus")
-- vim.opt.clipboard = "unnamedplus"
-- Undo remap
vim.cmd("noremap U <C-r>")
-- search while typing
vim.cmd("set incsearch")
-- highlight search
vim.cmd("set hlsearch")
-- vim.g.clipboard = {
--     name = "tmux",
--     copy = {
--         ["+"] = { "tmux", "load-buffer", "-" },
--         ["*"] = { "tmux", "load-buffer", "-" },
--     },
--     paste = {
--         ["+"] = { "tmux", "save-buffer", "-" },
--         ["*"] = { "tmux", "save-buffer", "-" },
--     },
--     cache_enabled = 0,
-- }
require("config.lazy")
