local set = vim.opt


---- General Options
-- Tab options.
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.number = true
set.relativenumber = true
set.mouse = 'a'

-- set to true for bufferline...
set.termguicolors = true

set.wrap = false

set.hlsearch = false
set.incsearch = true

set.scrolloff = 8

-- Tokyonight colorscheme options
vim.cmd[[colorscheme tokyonight]]

