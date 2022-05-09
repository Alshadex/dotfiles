require('plugins')
require('lualine').setup {
    options = {
        theme = 'powerline_dark'
    }
}
require('nvim-tree').setup()

-- Tab options.
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = true

-- Enable line numbers and relative line numbers.
vim.opt.number = true
vim.wo.relativenumber = true

