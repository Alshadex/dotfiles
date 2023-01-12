--[[
Neovim init file
Maintainer: Alex Lin
--]]

-- packer init
require('packer-init')

-- modules
require('core/options')
require('core/keymaps')

require('plugins/lualine-config')
require('plugins/nvim-tree-config')
require('plugins/telescope-config')
require('plugins/go-nvim-config')
require('plugins/nvim-treesitter-config')
require('plugins/nvim-lspconfig')
require('plugins/mason-nvim')
require('plugins/buffer-line-config')
require('plugins/gitsigns-config')
require('plugins/nvim-comment-config')
require('plugins/whitespace-nvim-config')
