--[[
Neovim init file
Maintainer: Alex Lin
--]]

-- Helper function to safely load modules
local function safe_require(module)
    local ok, err = pcall(require, module)
    if not ok then
        vim.notify('Failed to load ' .. module .. ': ' .. tostring(err), vim.log.levels.ERROR)
        return false
    end
    return true
end

-- Load core configuration
safe_require('core/options')
safe_require('core/keymaps')

-- Initialize lazy.nvim plugin manager
safe_require('lazy-init')
