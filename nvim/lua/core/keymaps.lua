local opts = {silent = true}

-- Leader keymap to ;
vim.g.mapleader = ';'

-- File explorer toggle
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', '<cmd>resize -1<CR>', opts)
vim.keymap.set('n', '<C-Down>', '<cmd>resize +1<CR>', opts)
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize +4<CR>', opts)
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize -4<CR>', opts)

-- Focus to different windows
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

