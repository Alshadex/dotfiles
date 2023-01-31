--[[
Neovim init file
Maintainer: Alex Lin
--]]

-- packer init
require('packer-init')

-- modules
require('core/options')
require('core/keymaps')

require('plugins/buffer-line-config')
require('plugins/gitsigns-config')
require('plugins/go-nvim-config')
require('plugins/guihua-config')
require('plugins/lualine-config')
require('plugins/mason-nvim')
require('plugins/nvim-comment-config')
require('plugins/nvim-lspconfig')
require('plugins/nvim-tree-config')
require('plugins/nvim-treesitter-config')
require('plugins/telescope-config')
require('plugins/tokyonight-config')
require('plugins/whitespace-nvim-config')
require('plugins/copilot-config')
