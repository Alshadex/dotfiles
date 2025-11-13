-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    -- Plugin manager
    spec = {
        -- Go development
        {
            'ray-x/go.nvim',
            dependencies = {
                'ray-x/guihua.lua',
            },
            config = function()
                require('plugins/go-nvim-config')
            end,
            ft = {"go", "gomod"},
        },

        -- Git integration
        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('plugins/gitsigns-config')
            end,
            event = "BufReadPre",
        },

        -- Git blame
        {
            "FabijanZulj/blame.nvim",
            config = function()
                require('plugins/blame-nvim-config')
            end,
            cmd = "BlameToggle",
        },

        -- Commenting
        {
            "terrortylor/nvim-comment",
            config = function()
                require('plugins/nvim-comment-config')
            end,
            keys = {"gcc", "gc"},
        },

        -- Colorscheme
        {
            'folke/tokyonight.nvim',
            lazy = false,
            priority = 1000,
            config = function()
                require('plugins/tokyonight-config')
            end,
        },

        -- LSP and completion
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v4.x',
            dependencies = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lua'},

                -- Snippets
                {'L3MON4D3/LuaSnip'},
                {'rafamadriz/friendly-snippets'},
            },
            config = function()
                require('plugins/lsp-zero-config')
            end,
            event = {"BufReadPre", "BufNewFile"},
        },

        -- Copilot
        {
            'github/copilot.vim',
            config = function()
                require('plugins/copilot-config')
            end,
            event = "InsertEnter",
        },

        -- Statusline
        {
            'nvim-lualine/lualine.nvim',
            dependencies = {'nvim-tree/nvim-web-devicons'},
            config = function()
                require('plugins/lualine-config')
            end,
        },

        -- File explorer
        {
            'nvim-tree/nvim-tree.lua',
            dependencies = {'nvim-tree/nvim-web-devicons'},
            config = function()
                require('plugins/nvim-tree-config')
            end,
            lazy = false,
        },

        -- Fuzzy finder
        {
            'nvim-telescope/telescope.nvim',
            dependencies = {'nvim-lua/plenary.nvim'},
            config = function()
                require('plugins/telescope-config')
            end,
            cmd = "Telescope",
            keys = {
                {"<leader>ff", desc = "Find files"},
                {"<leader>fg", desc = "Live grep"},
            },
        },

        -- Treesitter
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            config = function()
                require('plugins/nvim-treesitter-config')
            end,
            event = {"BufReadPost", "BufNewFile"},
        },

        -- Whitespace management
        {
            'johnfrankmorgan/whitespace.nvim',
            config = function()
                require('plugins/whitespace-nvim-config')
            end,
            event = "BufReadPre",
        },
    },

    -- Configure lazy.nvim options
    checker = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
