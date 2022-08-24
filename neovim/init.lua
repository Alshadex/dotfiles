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
require('plugins/nvim-tree-config') -- runs lua/nvim-tree-config/init.lua
require('plugins/telescope-config')
require('plugins/go-nvim-config')
require('plugins/nvim-treesitter-config')
require('plugins/nvim-lspconfig')

