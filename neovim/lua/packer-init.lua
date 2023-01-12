local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd([[packadd packer.nvim]])
end

return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'

	-- My plugins here 
	use 'ray-x/go.nvim'
	use 'ray-x/guihua.lua' -- recommanded if need floating window support
    use 'lewis6991/gitsigns.nvim'
    use "terrortylor/nvim-comment"

    use {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    }

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
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
	}

    use {
        'akinsho/bufferline.nvim', tag = "v2.*", 
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
        'johnfrankmorgan/whitespace.nvim',
    }



	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
