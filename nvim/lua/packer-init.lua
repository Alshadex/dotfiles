local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd([[packadd packer.nvim]])
end

return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
    use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua' -- recommanded if need floating window support
    use 'lewis6991/gitsigns.nvim'
    use "terrortylor/nvim-comment"
    use 'folke/tokyonight.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional
            -- {"zbirenbaum/copilot.lua"},
            -- use { 'github/copilot.vim' }
            -- {"zbirenbaum/copilot-cmp"},

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    use 'github/copilot.vim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

    use {
    	'kyazdani42/nvim-tree.lua',
    	requires = {'kyazdani42/nvim-web-devicons', -- optional, for file icon
    	},
    }

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
            {'nvim-lua/plenary.nvim'},
            {'BurntSushi/ripgrep'},
            {'sharkdp/fd'}
        }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
	}

    use {
        'johnfrankmorgan/whitespace.nvim',
    }

    use {
        "FabijanZulj/blame.nvim"
    }


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
