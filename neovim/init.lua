require('plugins')
require('lualine-config')
require('nvim-tree-config') -- runs lua/nvim-tree-config/init.lua
require('telescope-config')
require('go-nvim-config')
--require('lsp-format-config')


local set = vim.opt

-- Tab options.
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.number = true
set.relativenumber = true

--[[
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

-- Enable line numbers and relative line numbers.
vim.opt.number = true
vim.wo.relativenumber = false
--]]

