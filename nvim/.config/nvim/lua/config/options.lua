-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Fuck this we're using git and modern machines
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.isfname:append("@-@")

-- Random stuffs here
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.g.autoformat = false
vim.opt.laststatus = 3

vim.opt.clipboard = ''
