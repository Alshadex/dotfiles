require('plugins')
require('lualine-config')
require('nvim-tree-config') -- runs lua/nvim-tree-config/init.lua
require('telescope-config')
require('go-nvim-config')
require('nvim-treesitter-config')
--require('lsp-format-config')


local set = vim.opt


-- Tab options.
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Enable line numbers and relative line numbers.
set.number = true
-- set.relativenumber = false

