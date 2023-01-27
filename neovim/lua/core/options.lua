local set = vim.opt

-- Tab options.
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Enable line numbers and relative line numbers.
set.number = true
-- set.relativenumber = false

-- set to true for bufferline...
set.termguicolors = false

-- enable mouse usage.
set.mouse = 'a'

-- Don't add newline on save when there is a character on the last line.
-- not working atm.
-- set.nofixendofline = true

-- Sets tokyonight colorscheme
vim.cmd[[colorscheme tokyonight]]
