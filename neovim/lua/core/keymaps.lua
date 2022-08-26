local opts = {noremap = false, silent = true}

local keymap = vim.api.nvim_set_keymap

keymap('n', '<F6>', ':NvimTreeToggle<CR>', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Focus to different windows
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)


--keymap('v', '<A-j>', ":m .+2<CR>==", opts)
--keymap('v', '<A-k>', ":m .-1<CR>==", opts)

